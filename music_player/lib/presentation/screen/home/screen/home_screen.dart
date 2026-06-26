import 'package:flutter/material.dart';
import 'package:music_player/core/constants/app_colors.dart';
import 'package:music_player/presentation/screen/home/controller/media_controller.dart';
import 'package:music_player/presentation/screen/home/widget/song_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MediaController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MediaController(
      onStateChanged: () {
        if (mounted) setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Music Player')),
      body: Column(
        children: [
          const Center(child: Text('Welcome to the Music Player!')),
          Expanded(
            child: ListView.builder(
              itemCount: _controller.playlist.length,
              itemBuilder: (context, index) {
                final song = _controller.playlist[index];
                final isSelected = index == _controller.currentIndex;
                return SongListItem(
                  song: song,
                  index: index,
                  isPlaying: _controller.isPlaying,
                  isSelcted: isSelected,
                  onTap: () => _controller.playSongAtIndex(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
