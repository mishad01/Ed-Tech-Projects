import 'package:flutter/material.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({
    super.key,
    required this.isLoading,
    this.hintText,
    required this.onSend,
  });
  final bool isLoading;
  final String? hintText;
  IconData? icon;
  final void Function(String) onSend;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Type a message...',
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  widget.onSend(value);
                }
              },
            ),
          ),
          IconButton(
            icon: widget.isLoading
                ? const CircularProgressIndicator()
                : Icon(widget.icon ?? Icons.send),
            onPressed: widget.isLoading
                ? null
                : () {
                    // Handle send button press
                  },
          ),
        ],
      ),
    );
  }
}
