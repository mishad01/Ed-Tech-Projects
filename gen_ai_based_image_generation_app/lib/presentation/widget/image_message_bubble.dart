import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:llm_based_ai_chat_bot/core/constans/app_colors.dart';
import 'package:llm_based_ai_chat_bot/domain/entities/image_message.dart';

class ImageMessageBubble extends StatelessWidget {
  final ImageMessage message;

  const ImageMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isUser) return _UserPromptBubble(message: message);
    return _AssistantImageBubble(message: message);
  }
}

class _UserPromptBubble extends StatelessWidget {
  final ImageMessage message;
  const _UserPromptBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 64, right: 16, bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.userBubble,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.prompt,
              style: const TextStyle(
                color: AppColors.userText,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTime(message.time),
              style: const TextStyle(color: AppColors.timestamp, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _AssistantImageBubble extends StatelessWidget {
  final ImageMessage message;
  const _AssistantImageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 64, bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.botBubble,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (message.hasImage) _buildImage(message.imageUrl!),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: message.hasImage ? 8 : 12,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.textContent != null &&
                      message.textContent!.isNotEmpty)
                    Text(
                      message.textContent!,
                      style: const TextStyle(
                        color: AppColors.botText,
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                  if (message.textContent != null &&
                      message.textContent!.isNotEmpty)
                    const SizedBox(height: 4),
                  Text(
                    _formatTime(message.time),
                    style: const TextStyle(
                      color: AppColors.timestamp,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    late Widget imageWidget;

    if (imageUrl.startsWith('data:image')) {
      try {
        final base64Data = imageUrl.split(',')[1];
        final bytes = base64Decode(base64Data);
        imageWidget = Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _errorPlaceholder(),
        );
      } catch (_) {
        imageWidget = _errorPlaceholder();
      }
    } else {
      imageWidget = Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return _loadingPlaceholder();
        },
        errorBuilder: (_, _, _) => _errorPlaceholder(),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: imageWidget,
      ),
    );
  }

  Widget _loadingPlaceholder() => Container(
    height: 200,
    width: 280,
    color: Colors.grey.shade100,
    child: const Center(child: CircularProgressIndicator()),
  );

  Widget _errorPlaceholder() => Container(
    height: 200,
    width: 280,
    color: Colors.grey.shade100,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.broken_image_outlined, size: 48, color: Colors.grey),
        SizedBox(height: 8),
        Text('Failed to load image', style: TextStyle(color: Colors.grey)),
      ],
    ),
  );

  String _formatTime(DateTime time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
