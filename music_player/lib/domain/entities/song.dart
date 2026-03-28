class Song {
  final String title;
  final String artist;
  final String? url;
  final int durationSeconds;

  const Song({
    required this.title,
    required this.artist,
    required this.url,
    required this.durationSeconds,
  });
}
