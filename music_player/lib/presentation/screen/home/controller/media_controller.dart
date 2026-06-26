import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/data/model/song_model.dart';
import 'package:music_player/domain/entities/song.dart';

/// Owns all playback state and logic. The widget creates one of these, passes
/// an [onStateChanged] callback (which calls setState), and just reads the
/// getters in build — no state-management package involved.
class MediaController {
  MediaController({required this.onStateChanged}) {
    _init();
  }

  // Called whenever state changes so the widget can rebuild via setState.
  final void Function() onStateChanged;

  // The actual audio player instance from the audioplayers package
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Our hardcoded list of songs to play
  final List<Song> _playlist = SongModel.getSampleSongs();

  // Internal state
  int _currentIndex = 0; // Which song in the playlist is currently active
  bool _isPlaying = false; // Is the audio currently playing or paused?
  Duration _duration = Duration.zero; // Total length of the current song
  Duration _position = Duration.zero; // Current playback position in the song

  // Read-only access for the UI
  List<Song> get playlist => _playlist;
  Song? get currentSong =>
      _playlist.isNotEmpty ? _playlist[_currentIndex] : null;
  int get currentIndex => _currentIndex;
  bool get isPlaying => _isPlaying;
  Duration get duration => _duration;
  Duration get position => _position;

  void _init() {
    // Listen to duration changes (e.g., when a new song loads and we know its length)
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _duration = newDuration;
      onStateChanged();
    });

    // Listen to position changes (fires frequently to update the progress bar)
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _position = newPosition;
      onStateChanged();
    });

    // Listen to state changes (playing, paused, stopped, completed)
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      onStateChanged();
    });

    // Automatically play the next song when the current one finishes
    _audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });

    // If we have songs in the playlist, prepare the first one
    if (_playlist.isNotEmpty) {
      _setAudioSource();
    }
  }

  // Load the current song into the player without starting playback
  Future<void> _setAudioSource() async {
    if (currentSong != null) {
      await _audioPlayer.setSourceUrl(currentSong!.url!);

      // Set duration from our model immediately so the UI shows it before audio loads
      _duration = Duration(seconds: currentSong!.durationSeconds);
      _position = Duration.zero;
      onStateChanged();
    }
  }

  // Toggle between play and pause states
  Future<void> playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      // UrlSource is used for playing audio from the internet
      await _audioPlayer.play(UrlSource(currentSong!.url!));
    }
  }

  // Play a specific song chosen from the list
  Future<void> playSongAtIndex(int index) async {
    if (index >= 0 && index < _playlist.length) {
      _currentIndex = index;
      await _setAudioSource();
      await _audioPlayer.play(UrlSource(currentSong!.url!));
    }
  }

  // Load and instantly play the current song
  Future<void> _playCurrentSong() async {
    await _setAudioSource();
    await _audioPlayer.play(UrlSource(currentSong!.url!));
  }

  // Play the next song, looping back to the start if at the end
  Future<void> playNext() async {
    // Circular logic: (current + 1) % length -> (2 + 1) % 3 = 0
    _currentIndex = (_currentIndex + 1) % _playlist.length;
    await _playCurrentSong();
  }

  // Play the previous song, looping around to the end if at the start
  Future<void> playPrevious() async {
    // Circular logic: (current - 1 + length) % length -> (0 - 1 + 3) % 3 = 2
    _currentIndex = (_currentIndex - 1 + _playlist.length) % _playlist.length;
    await _playCurrentSong();
  }

  // Always dispose of the player to prevent memory leaks!
  void dispose() {
    _audioPlayer.dispose();
  }
}
