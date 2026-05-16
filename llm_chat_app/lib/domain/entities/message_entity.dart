class MessageEntity {
  final String role;
  final String text;
  final DateTime time;

  MessageEntity({required this.role, required this.text, required this.time});

  bool get isUser => role == 'user';
}
