import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/model/song_model.dart';
import 'package:music_player/domain/entities/song.dart';

class MediaProvider extends ChangeNotifier {
  // The actual audio player instance from the audioplayers package
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Our hardcoded list of songs to play
  final List<Song> _playlist = SongModel.getSampleSongs();

  // State variables that our UI will listen to and rebuild when changed
  int _currentIndex = 0; // Which song in the playlist is currently active
  bool _isPlaying = false; // Is the audio currently playing or paused?
  Duration _duration = Duration.zero; // Total length of the current song
  Duration _position = Duration.zero; // Current playback position in the song

  // Getters allow our UI to read the state without being able to modify it directly
  List<Song> get playlist => _playlist;
  Song? get currentSong =>
      _playlist.isNotEmpty ? _playlist[_currentIndex] : null;
  bool get isPlaying => _isPlaying;
  Duration get duration => _duration;
  Duration get position => _position;
  int get currentIndex => _currentIndex;

  MediaProvider() {
    // When the provider is created, initialize the audio player listeners
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    // Listen to duration changes (e.g., when a new song loads and we know its length)
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _duration = newDuration;
      // notifyListeners() tells any UI widget listening to this provider to rebuild
      notifyListeners();
    });

    // Listen to position changes (fires frequently as the song plays to update the progress bar)
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _position = newPosition;
      notifyListeners();
    });

    // Listen to state changes (playing, paused, stopped, completed)
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
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

  // Helper method to load the current song into the audio player
  Future<void> _setAudioSource() async {
    if (currentSong != null) {
      final url = currentSong!.url;
      // Set the source but don't play it yet
      await _audioPlayer.setSourceUrl(url!);

      // We set duration from our model immediately so the UI shows it before the audio fully loads
      _duration = Duration(seconds: currentSong!.durationSeconds);
      _position = Duration.zero;
      notifyListeners();
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

  // A reusable helper to load and instantly play the newly selected song

  // Play a specific song chosen from the list
  Future<void> playSongAtIndex(int index) async {
    if (index >= 0 && index < _playlist.length) {
      _currentIndex = index; // Update our active index
      await _setAudioSource();
      await _audioPlayer.play(UrlSource(currentSong!.url!));
      notifyListeners();
    }
  }

  Future<void> _playCurrentSong() async {
    await _setAudioSource();
    await _audioPlayer.play(UrlSource(currentSong!.url!));
    notifyListeners();
  }

  // Play the next song in the list, looping back to the start if at the end
  Future<void> playNext() async {
    // Circular logic: (current + 1) modulo length
    // Example: (2 + 1) % 3 = 0. So it loops from index 2 back to 0.
    _currentIndex = (_currentIndex + 1) % _playlist.length;
    await _playCurrentSong();
  }

  // Play the previous song, looping around to the end if at the start
  Future<void> playPrevious() async {
    // Circular logic: (current - 1 + length) modulo length
    // Example: (0 - 1 + 3) % 3 = 2. So it loops from index 0 back to 2.
    _currentIndex = (_currentIndex - 1 + _playlist.length) % _playlist.length;
    await _playCurrentSong();
  }

  // Jump to a specific time in the song (used by the slider)
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    // Always dispose of controllers and players to prevent memory leaks!
    _audioPlayer.dispose();
    super.dispose();
  }
}
