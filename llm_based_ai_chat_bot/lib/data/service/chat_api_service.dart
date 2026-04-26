import 'dart:convert';

import 'package:llm_based_ai_chat_bot/core/constans/app_strings.dart';
import 'package:llm_based_ai_chat_bot/data/model/message_model.dart';
import 'package:http/http.dart' as http;

class ChatApiService {
  Future<String> fetchAssistantReply(List<MessageModel> messages) async {
    final response = await http
        .post(
          Uri.parse('${AppStrings.baseUrl}/v1/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppStrings.apiKey}',
          },
          body: jsonEncode({
            'model': AppStrings.model,
            'messages': [
              {"role": "system", "content": AppStrings.systemPrompt},
              ...messages.map((message) => message.toApiMap()),
            ],
          }),
        )
        .timeout(Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to fetch assistant reply: ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body);
    return (data['choices'][0]['message']['content'] as String).trim();
  }
}
