import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';

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
  TextEditingController _controller = TextEditingController();

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _handleSend(),

              decoration: InputDecoration(
                hintText: widget.hintText ?? AppStrings.inputHint,
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: AppColors.background,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          GestureDetector(
            onTap: _handleSend,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: widget.isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Icon(widget.icon ?? Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
