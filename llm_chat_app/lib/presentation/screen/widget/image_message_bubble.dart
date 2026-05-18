import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/domain/entities/image_message.dart';

class ImageMessageBubble extends StatelessWidget {
  final ImageMessage message;

  const ImageMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isUser ? 64 : 16,
          right: isUser ? 16 : 64,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: isUser ? AppColors.userBubble : AppColors.botBubble,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isUser ? 20 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isUser ? _buildUserContent() : _buildAssistantContent(),
      ),
    );
  }

  Widget _buildUserContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    );
  }

  Widget _buildAssistantContent() {
    return Column(
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
                  message.textContent!.isNotEmpty) ...[
                Text(
                  message.textContent!,
                  style: const TextStyle(
                    color: AppColors.botText,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
              ],
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
    );
  }

  Widget _buildImage(String imageUrl) {
    final imageWidget = imageUrl.startsWith('data:image')
        ? _buildBase64Image(imageUrl)
        : Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) =>
                progress == null ? child : _loadingPlaceholder(),
            errorBuilder: (_, __, ___) => _errorPlaceholder(),
          );

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

  Widget _buildBase64Image(String imageUrl) {
    try {
      final bytes = base64Decode(imageUrl.split(',')[1]);
      return Image.memory(
        bytes,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _errorPlaceholder(),
      );
    } catch (_) {
      return _errorPlaceholder();
    }
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
