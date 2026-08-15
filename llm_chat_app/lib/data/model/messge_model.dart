import 'package:llm_chat_app/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.role,
    required super.text,
    required super.time,
    super.imageBytes,
  });

  Map<String, String> toMap() => {'role': role, 'content': text};
}
