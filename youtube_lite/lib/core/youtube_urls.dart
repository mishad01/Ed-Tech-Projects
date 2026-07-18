class YoutubeUrls {
  YoutubeUrls._();
  //This pattern is usually used when a class is only meant to
  // store static constants or helper methods, not to create objects.

  static const String base = 'https://m.youtube.com';

  // Primary navigation
  static const String home = 'https://m.youtube.com/';
  static const String shorts = 'https://m.youtube.com/shorts';
  static const String subscriptions =
      'https://m.youtube.com/feed/subscriptions';
  static const String explore = 'https://m.youtube.com/feed/explore';
  static const String trending = 'https://m.youtube.com/feed/trending';

  // Library
  static const String history = 'https://m.youtube.com/feed/history';
  static const String watchLater = 'https://m.youtube.com/playlist?list=WL';
  static const String likedVideos = 'https://m.youtube.com/playlist?list=LL';

  // Search
  static const String search = 'https://m.youtube.com/results?search_query=';

  // More
  static const String settings = 'https://www.youtube.com/account';
  static const String help = 'https://support.google.com/youtube';
}
