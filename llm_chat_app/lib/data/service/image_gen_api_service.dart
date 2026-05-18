import 'dart:convert';

import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/domain/entities/image_message.dart';
import 'package:http/http.dart' as http;

class ImageGenApiService {
  Future<ImageMessage> generateImage(String prompt) async {
    print(
      '[ImageGen] Sending request to: ${AppStrings.imageGenBaseUrl}/chat/completions',
    );
    print('[ImageGen] Model: ${AppStrings.imageGenModel}');
    print('[ImageGen] Prompt: $prompt');

    final response = await http
        .post(
          Uri.parse('${AppStrings.imageGenBaseUrl}/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppStrings.imageGenApiKey}',
          },
          body: jsonEncode({
            'model': AppStrings.imageGenModel,
            'max_tokens': 1024,
            'messages': [
              {'role': 'user', 'content': prompt},
            ],
            'modalities': ['image', 'text'],
          }),
        )
        .timeout(const Duration(seconds: 60));

    print('[ImageGen] Status code: ${response.statusCode}');
    print('[ImageGen] Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Failed to generate image: ${response.statusCode}');
    }

    final message = jsonDecode(response.body)['choices'][0]['message'];
    final content = message['content'];
    final images = message['images'];

    if (images is! List || images.isEmpty) {
      throw Exception('No image was returned. Try a more descriptive prompt.');
    }

    return ImageMessage(
      role: 'assistant',
      prompt: prompt,
      imageUrl: images[0]['image_url']['url'] as String,
      textContent: content is String && content.trim().isNotEmpty
          ? content.trim()
          : null,
      time: DateTime.now(),
    );
  }
}
