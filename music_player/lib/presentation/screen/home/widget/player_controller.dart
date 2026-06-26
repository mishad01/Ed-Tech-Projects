import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_colors.dart';
import 'package:music_player/domain/entities/song.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({
    super.key,
    required this.currentSong,
    required this.isPlaying,
    required this.duration,
    required this.position,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
  });
  final Song currentSong;
  final bool isPlaying;
  final Duration duration;
  final Duration position;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    final song = currentSong;
    String _formatDuration(int seconds) {
      final minutes = seconds ~/ 60;
      final remainingSeconds = seconds % 60;
      return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(song.title, style: TextStyle(color: AppColors.textPrimary)),
          Text(song.artist, style: TextStyle(color: AppColors.textSecondary)),
          Slider(
            value: position.inSeconds.toDouble(),
            max: duration.inSeconds.toDouble(),
            onChanged: (value) {
              // Handle seeking
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(position.inSeconds),
                style: TextStyle(color: AppColors.textSecondary),
              ),
              Text(
                _formatDuration(duration.inSeconds),
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                iconSize: 50,
                onPressed: onPrevious,
                color: AppColors.textPrimary,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: onPlayPause,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                iconSize: 50,
                onPressed: onNext,
                color: AppColors.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
