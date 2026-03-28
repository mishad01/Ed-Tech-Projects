import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_colors.dart';
import 'package:music_player/domain/entities/song.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({
    super.key,
    required this.song,
    required this.index,
    required this.isPlaying,
    required this.isSelected,
    required this.onTap,
  });
  final Song song;
  final int index;
  final bool isPlaying;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withValues(alpha: 0.2)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: isSelected && isPlaying
            ? Icon(Icons.music_note, color: AppColors.accent)
            : Text(
                '${index + 1}',
                style: TextStyle(
                  color: isSelected
                      ? AppColors.accent
                      : AppColors.textSecondary,
                  fontWeight: .bold,
                ),
              ),
      ),
      title: Text(
        song.title,
        style: TextStyle(
          color: isSelected ? AppColors.accent : AppColors.textSecondary,
        ),
      ),
      subtitle: Text(
        song.artist,
        style: TextStyle(
          color: isSelected ? AppColors.accent : AppColors.textSecondary,
        ),
      ),
      onTap: onTap,
      trailing: Text(
        _formatDuration(Duration(seconds: song.durationSeconds)),
        style: TextStyle(color: AppColors.textSecondary),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes : $seconds';
  }
}
