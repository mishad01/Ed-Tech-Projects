import 'package:llm_based_ai_chat_bot/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({required super.role, required super.text, required super.time});

  // Sample - -> Ui without making a real API call
  factory MessageModel.sampleUser() => MessageModel(
    role: 'user',
    text: 'Hello! What can you help me with?',
    time: DateTime.now(),
  );
  factory MessageModel.sampleBot() => MessageModel(
    role: 'assistant',
    text: 'Ho there! I am you AI assistant. Ask me anything',
    time: DateTime.now(),
  );

  //Converts to the format that API expects
  Map<String, String> toApiMap() => {'role': role, 'content': text};
}
