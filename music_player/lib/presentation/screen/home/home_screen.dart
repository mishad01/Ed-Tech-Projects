import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_colors.dart';
import 'package:music_player/core/constants/app_strings.dart';
import 'package:music_player/presentation/screen/home/provider/media_provider.dart';
import 'package:music_player/presentation/screen/home/widget/player_controller.dart';
import 'package:music_player/presentation/screen/home/widget/song_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.surface,
      ),
      body: Column(
        children: [
          PlayerController(),
          Expanded(
            child: Consumer<MediaProvider>(
              builder: (context, provider, child) {
                final playlist = provider.playlist;
                return ListView.builder(
                  itemCount: playlist.length,
                  itemBuilder: (context, index) {
                    final song = playlist[index];

                    //Chceks if the item is currently playing song
                    final isSelected = index == provider.currentIndex;

                    return SongListItem(
                      song: song,
                      index: index,
                      isPlaying: provider.isPlaying,
                      isSelected: isSelected,
                      onTap: () {
                        provider.playSongAtIndex(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
