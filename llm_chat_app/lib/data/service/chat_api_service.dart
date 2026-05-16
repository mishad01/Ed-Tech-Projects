import 'dart:convert';

import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/data/model/message_model.dart';
import 'package:http/http.dart' as http;

class ChatApiService {
  Future<String> fetchAssistantReply(List<MessageModel> messages) async {
    print('[Chat] Sending request to: ${AppStrings.baseUrl}/chat/completions');
    print('[Chat] Model: ${AppStrings.model}');
    print('[Chat] Message count: ${messages.length}');

    final response = await http
        .post(
          Uri.parse('${AppStrings.baseUrl}/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppStrings.apiKey}',
          },
          body: jsonEncode({
            'model': AppStrings.model,
            'max_tokens': 1024,
            'messages': [
              {"role": "system", "content": AppStrings.systemPrompt},
              ...messages.map((message) => message.toApiMap()),
            ],
          }),
        )
        .timeout(Duration(seconds: 30));

    print('[Chat] Status code: ${response.statusCode}');
    print('[Chat] Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to fetch assistant reply: ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body);
    return (data['choices'][0]['message']['content'] as String).trim();
  }
}
