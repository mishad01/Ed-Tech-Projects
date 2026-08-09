class MessageEntity {
  MessageEntity({required this.role, required this.text, required this.time});

  final String role;
  final String text;
  final DateTime time;

  bool get isUser => role == 'user';
}
