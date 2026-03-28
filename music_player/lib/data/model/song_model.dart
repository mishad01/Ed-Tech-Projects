import 'package:music_player/domain/entities/song.dart';

class SongModel extends Song {
  const SongModel({
    required super.title,
    required super.artist,
    required super.url,
    required super.durationSeconds,
  });

  static List<Song> getSampleSongs() {
    return const [
      SongModel(
        title: 'Lofi Study',
        artist: 'FASSounds',
        url:
            'https://cdn.pixabay.com/download/audio/2022/05/27/audio_1808fbf07a.mp3',
        durationSeconds: 146,
      ),
      SongModel(
        title: 'Good Night',
        artist: 'FASSounds',
        url:
            'https://cdn.pixabay.com/download/audio/2022/10/14/audio_9939f792cb.mp3',
        durationSeconds: 147,
      ),
      SongModel(
        title: 'Cinematic Time Lapse',
        artist: 'Lexin_Music',
        url:
            'https://cdn.pixabay.com/download/audio/2022/08/02/audio_884fe92c21.mp3',
        durationSeconds: 135,
      ),
    ];
  }
}
