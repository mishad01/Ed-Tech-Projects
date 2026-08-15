import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/presentation/chat/widget/chat_input_field.dart';
import 'package:llm_chat_app/presentation/chat/widget/message_bubble.dart';
import 'package:llm_chat_app/presentation/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isImage = false;

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _toggleInputMode() {
    setState(() {
      _isImage = !_isImage;
    });
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
        actions: [
          IconButton(
            icon: Icon(
              _isImage ? Icons.image_outlined : Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            onPressed: _toggleInputMode,
          ),
        ],
      ),
      body: Consumer<ChatProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: provider.messages.isEmpty && !provider.isLoading
                      ? Center(child: Text('No messages yet'))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: provider.messages.length,
                            itemBuilder: (context, index) {
                              final message = provider.messages[index];
                              return MessageBubble(message: message);
                            },
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatInputField(
                    isLoading: false,
                    hintText: _isImage
                        ? 'Send an image...'
                        : 'Type a message...',
                    icon: _isImage ? Icons.auto_awesome : Icons.send,
                    onSend: (message) {
                      if (_isImage) {
                        provider.generateImage(message);
                      } else {
                        provider.sendMessage(message);
                      }
                      scrollToBottom();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
