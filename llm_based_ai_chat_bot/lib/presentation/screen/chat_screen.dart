import 'package:flutter/material.dart';
import 'package:llm_based_ai_chat_bot/core/constans/app_colors.dart';
import 'package:llm_based_ai_chat_bot/presentation/provider/chat_provider.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/chat_input_field.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/empty_chat.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/message_bubble.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/typing_indicator.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          spacing: 12,
          mainAxisAlignment: .spaceBetween,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(color: Colors.white, shape: .circle),
              child: Icon(Icons.smart_toy_outlined, size: 22),
            ),
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: .w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, provider, _) {
          if (provider.messages.isNotEmpty || provider.isLoading) {
            _scrollToBottom();
          }

          return Column(
            children: [
              Expanded(
                child: provider.messages.isEmpty && !provider.isLoading
                    ? EmptyChat()
                    : ListView.builder(
                        itemCount:
                            provider.messages.length +
                            (provider.isLoading ? 1 : 0),
                        controller: _scrollController,
                        padding: .symmetric(vertical: 16),
                        itemBuilder: (context, index) {
                          if (index == provider.messages.length) {
                            return TypingIndicator();
                          }

                          return MessageBubble(
                            message: provider.messages[index],
                          );
                        },
                      ),
              ),

              ChatInputField(
                onSend: provider.sendMessage,
                isLoading: provider.isLoading,
              ),
            ],
          );
        },
      ),
    );
  }
}
