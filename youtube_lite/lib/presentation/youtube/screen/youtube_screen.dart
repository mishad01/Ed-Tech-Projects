import 'package:flutter/material.dart';
import 'package:youtube_lite/presentation/core/widget/web_view_wrapper.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return WebViewWrapper(title: title, url: url);
  }
}
