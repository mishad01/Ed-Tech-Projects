import 'package:flutter/foundation.dart';

class MessageEntity {
  MessageEntity({
    required this.role,
    required this.text,
    required this.time,
    this.imageBytes,
  });

  final String role;
  final String text;
  final DateTime time;
  final Uint8List? imageBytes;

  bool get isUser => role == 'user';
  bool get hasImage => imageBytes != null;
}
