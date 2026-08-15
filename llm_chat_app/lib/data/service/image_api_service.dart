import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:llm_chat_app/core/constans/app_strings.dart';

/// Thrown when the OpenRouter account has no credits left for image models.
class OutOfCreditsException implements Exception {
  const OutOfCreditsException();
}

class ImageApiService {
  Future<Uint8List> generateImage(String prompt) async {
    print('[Image] Sending request to: ${AppStrings.baseUrl}/chat/completions');
    print('[Image] Model: ${AppStrings.imageModel}');
    print('[Image] Prompt: $prompt');

    final response = await http
        .post(
          Uri.parse('${AppStrings.baseUrl}/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppStrings.apiKey}',
          },
          body: jsonEncode({
            'model': AppStrings.imageModel,
            // Tells the model to reply with an image instead of plain text.
            'modalities': ['image', 'text'],
            // OpenRouter reserves the model's full context against the account
            // balance up front, so without a cap the request is rejected with
            // a 402 even when there is enough credit for the actual image.
            // A generated image costs ~1100-1550 tokens, so 2048 leaves
            // headroom while still fitting a nearly-drained free-tier balance.
            'max_tokens': 2048,
            'messages': [
              {'role': 'user', 'content': prompt},
            ],
          }),
        )
        .timeout(const Duration(seconds: 60));

    print('[Image] Status code: ${response.statusCode}');

    if (response.statusCode == 402) {
      print('[Image] Response body: ${response.body}');
      throw const OutOfCreditsException();
    }

    if (response.statusCode != 200) {
      print('[Image] Response body: ${response.body}');
      throw Exception('Failed to generate image: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final images = data['choices'][0]['message']['images'] as List?;

    if (images == null || images.isEmpty) {
      throw Exception('No image returned for this prompt');
    }

    final imageUrl = images.first['image_url']['url'] as String;

    // The model returns either a base64 data URL or a plain https link.
    if (imageUrl.startsWith('http')) {
      final imageResponse = await http
          .get(Uri.parse(imageUrl))
          .timeout(const Duration(seconds: 30));

      if (imageResponse.statusCode != 200) {
        throw Exception(
          'Failed to download image: ${imageResponse.statusCode}',
        );
      }

      return imageResponse.bodyBytes;
    }

    return compute(_decodeBase64Image, imageUrl);
  }
}

Uint8List _decodeBase64Image(String dataUrl) {
  return base64Decode(dataUrl.split(',').last);
}
