import 'package:flutter/material.dart';
import 'package:llm_based_ai_chat_bot/core/constans/app_colors.dart';
import 'package:llm_based_ai_chat_bot/core/constans/app_strings.dart';
import 'package:llm_based_ai_chat_bot/presentation/provider/image_gen_provider.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/chat_input_field.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/empty_image_gen.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/image_message_bubble.dart';
import 'package:llm_based_ai_chat_bot/presentation/widget/typing_indicator.dart';
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          spacing: 12,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 20,
                color: AppColors.primary,
              ),
            ),
            const Text(
              'Image Generator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Consumer<ImageGenProvider>(
            builder: (context, provider, _) {
              if (provider.messages.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.white),
                tooltip: 'Clear',
                onPressed: provider.clearImages,
              );
            },
          ),
        ],
      ),
      body: Consumer<ImageGenProvider>(
        builder: (context, provider, _) {
          if (provider.messages.isNotEmpty || provider.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => _scrollToBottom(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: provider.messages.isEmpty && !provider.isLoading
                    ? const EmptyImageGen()
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemCount:
                            provider.messages.length +
                            (provider.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == provider.messages.length) {
                            return const TypingIndicator();
                          }
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
          );
        },
      ),
    );
  }
}
