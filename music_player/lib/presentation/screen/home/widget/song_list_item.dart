import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_colors.dart';
import 'package:music_player/domain/entities/song.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({
    super.key,
    required this.song,
    required this.index,
    required this.isPlaying,
    required this.isSelcted,
    required this.onTap,
  });

  final Song song;
  final int index;
  final bool isPlaying;
  final bool isSelcted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.2),
        child: Text(
          '${index + 1}',
          style: const TextStyle(color: AppColors.primary),
        ),
      ),
      title: Text(
        song.title,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      subtitle: Text(
        song.artist,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      trailing: isSelcted
          ? Icon(isPlaying ? Icons.pause : Icons.play_arrow)
          : Text(
              _formatDuration(song.durationSeconds),
              style: const TextStyle(color: AppColors.textSecondary),
            ),
      onTap: onTap,
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
