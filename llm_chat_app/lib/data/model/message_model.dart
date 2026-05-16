import 'package:llm_chat_app/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({required super.role, required super.text, required super.time});

  Map<String, String> toApiMap() => {'role': role, 'content': text};
}
