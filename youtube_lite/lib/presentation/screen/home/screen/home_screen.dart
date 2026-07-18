import 'package:flutter/material.dart';
import 'package:youtube_lite/core/app_colors.dart';
import 'package:youtube_lite/core/app_strings.dart';
import 'package:youtube_lite/core/youtube_urls.dart';
import 'package:youtube_lite/presentation/screen/home/widget/youtube_nav_tile.dart';
import 'package:youtube_lite/presentation/screen/youtube/screen/youtube_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openUrl(String title, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubeScreen(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10,
          children: [
            Container(
              height: 26,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.youtubePrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
              ),
            ),
            Text(
              AppStrings.appName,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundDark,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.textPrimary),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: AppColors.textPrimary),
          ),
        ],
      ),
      body: SafeArea(child: Column(children: [_buildNavList()])),
    );
  }

  Widget _buildNavList() {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Browser",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textHint,
              ),
            ),
          ),
          YoutubeNavTile(
            icon: Icons.home,
            label: "Home",
            onTap: () => _openUrl(AppStrings.appName, YoutubeUrls.home),
          ),
          YoutubeNavTile(
            icon: Icons.play_circle,
            label: "Shorts",
            onTap: () {},
          ),
          YoutubeNavTile(
            icon: Icons.subscriptions,
            label: "Subscriptions",
            onTap: () {},
          ),
          YoutubeNavTile(icon: Icons.explore, label: "Explore", onTap: () {}),
          YoutubeNavTile(
            icon: Icons.trending_up,
            label: "Trending",
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Library",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textHint,
              ),
            ),
          ),
          YoutubeNavTile(icon: Icons.history, label: "History", onTap: () {}),
          YoutubeNavTile(
            icon: Icons.watch_later,
            label: "Watch Later",
            onTap: () {},
          ),
          YoutubeNavTile(
            icon: Icons.thumb_up,
            label: "Liked Videos",
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "More",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textHint,
              ),
            ),
          ),
          YoutubeNavTile(icon: Icons.settings, label: "Settings", onTap: () {}),
          YoutubeNavTile(icon: Icons.help, label: "Help", onTap: () {}),
        ],
      ),
    );
  }
}
