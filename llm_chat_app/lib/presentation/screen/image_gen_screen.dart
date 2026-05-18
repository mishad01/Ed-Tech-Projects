import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/presentation/provider/image_gen_provider.dart';
import 'package:llm_chat_app/presentation/screen/widget/chat_input_field.dart';
import 'package:llm_chat_app/presentation/screen/widget/empty_image_gen.dart';
import 'package:llm_chat_app/presentation/screen/widget/image_message_bubble.dart';
import 'package:provider/provider.dart';

class ImageGenScreen extends StatefulWidget {
  const ImageGenScreen({super.key});

  @override
  State<ImageGenScreen> createState() => _ImageGenScreenState();
}

class _ImageGenScreenState extends State<ImageGenScreen> {
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
      body: Consumer<ImageGenProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: provider.messages.isEmpty && !provider.isLoading
                      ? EmptyImageGen()
                      : ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: provider.messages.length,
                          itemBuilder: (context, index) {
                            final image = provider.messages[index];
                            return ImageMessageBubble(
                              message: provider.messages[index],
                            );
                          },
                        ),
                ),
                ChatInputField(
                  onSend: provider.generateImage,
                  isLoading: provider.isLoading,
                  hintText: AppStrings.imageGenInputHint,
                  sendIcon: Icons.auto_awesome,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
