import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:llm_based_ai_chat_bot/core/constans/app_strings.dart';
import 'package:llm_based_ai_chat_bot/domain/entities/image_message.dart';

class ImageGenApiService {
  Future<ImageMessage> generateImage(String prompt) async {
    final response = await http
        .post(
          Uri.parse('${AppStrings.imageGenBaseUrl}/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppStrings.imageGenApiKey}',
          },
          body: jsonEncode({
            'model': AppStrings.imageGenModel,
            'messages': [
              {'role': 'user', 'content': prompt},
            ],
            'modalities': ['image', 'text'],
          }),
        )
        .timeout(const Duration(seconds: 60));

    print('[ImageGen] Status code: ${response.statusCode}');
    print(
      '[ImageGen] Response body (truncated): ${response.body.length > 500 ? response.body.substring(0, 500) : response.body}',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to generate image: ${response.statusCode}');
    }

    final message = jsonDecode(response.body)['choices'][0]['message'];
    final content = message['content'];
    final images = message['images'];

    print('[ImageGen] content: $content');
    print(
      '[ImageGen] images null? ${images == null} | is list? ${images is List} | length: ${images is List ? images.length : "N/A"}',
    );

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
