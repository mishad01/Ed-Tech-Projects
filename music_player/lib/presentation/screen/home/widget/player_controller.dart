import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_colors.dart';
import 'package:music_player/presentation/screen/home/provider/media_provider.dart';
import 'package:provider/provider.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        final currentSong = provider.currentSong;

        if (currentSong == null) {
          return SizedBox.shrink();
        }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                currentSong.title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: .bold,
                ),
                textAlign: .center,
                overflow: .fade,
              ),
              Text(
                currentSong.artist,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
                textAlign: .center,
                overflow: .fade,
              ),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTickMarkColor: AppColors.accent,
                  inactiveTickMarkColor: AppColors.textSecondary.withValues(
                    alpha: 0.2,
                  ),
                  thumbColor: AppColors.accent,
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 14),
                ),
                child: Slider(
                  //it basically ensures it never goes out of bound
                  value: provider.position.inMilliseconds.toDouble().clamp(
                    0.0,
                    provider.duration.inMilliseconds.toDouble() > 0
                        ? provider.duration.inMilliseconds.toDouble()
                        : 1.0,
                  ),
                  onChanged: (value) {
                    provider.seek(Duration(milliseconds: value.toInt()));
                  },
                  min: 0.0,
                  max: provider.duration.inMilliseconds.toDouble() > 0
                      ? provider.duration.inMilliseconds.toDouble()
                      : 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      _formatDuration(provider.position),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      _formatDuration(provider.duration),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  IconButton(
                    onPressed: () => provider.playPrevious(),
                    icon: Icon(
                      Icons.skip_previous,
                      size: 50,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => provider.playPause(),
                      icon: Icon(
                        provider.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 24),

                  IconButton(
                    onPressed: () => provider.playNext(),
                    icon: Icon(
                      Icons.skip_next,
                      size: 50,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes : $seconds';
  }
}
