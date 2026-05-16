import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/presentation/provider/chat_provider.dart';
import 'package:llm_chat_app/presentation/screen/widget/chat_input_field.dart';
import 'package:llm_chat_app/presentation/screen/widget/empty_chat.dart';
import 'package:llm_chat_app/presentation/screen/widget/message_bubble.dart';
import 'package:llm_chat_app/presentation/screen/widget/typing_indecator.dart';
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
        duration: Duration(milliseconds: 300),
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
            Text(
              AppStrings.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: .w500,
              ),
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
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: provider.messages.isEmpty && !provider.isLoading
                      ? EmptyChat()
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount:
                              provider.messages.length +
                              (provider.isLoading ? 1 : 0),
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
            ),
          );
        },
      ),
    );
  }
}
