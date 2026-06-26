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
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelcted ? AppColors.primary.withValues(alpha: 0.2) : null,
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: TextStyle(
              color: isSelcted ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ),
      ),
      title: Text(
        song.title,
        style: TextStyle(
          color: isSelcted ? AppColors.primary : AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        song.artist,
        style: TextStyle(
          color: isSelcted ? AppColors.primary : AppColors.textPrimary,
        ),
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
