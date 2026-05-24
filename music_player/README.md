# Music Player

A Flutter audio player app that streams songs from remote URLs and provides full playback controls. Built to demonstrate the `audioplayers` package, Provider-driven media state, and feature-based architecture with a clean domain/data separation.

<img width="300" height="607" alt="Music Player Screenshot" src="https://github.com/user-attachments/assets/6496a592-9993-4b3e-bdf9-94dfc64ca725" />

## Features

- **Song list** — Browse a playlist of tracks showing track number, title, and artist.
- **Player controller** — Persistent top section with play/pause, previous, and next controls plus a seek slider.
- **Streaming playback** — Songs are streamed from remote URLs via `audioplayers`; no local file storage required.
- **Circular playlist navigation** — Next wraps to the first track; previous wraps to the last.
- **Auto-advance** — Automatically plays the next song when the current one finishes.
- **Real-time progress** — Seek bar and position label update continuously during playback.
- **Selected track highlight** — The currently playing song is visually distinguished in the list.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core` and clean `domain`/`data` separation.

```
App
├── core/
│   └── constants/          # AppColors, AppStrings
├── data/
│   └── model/              # SongModel (static sample songs + URL data)
├── domain/
│   └── entities/           # Song (pure entity: title, artist, url, durationSeconds)
└── presentation/
    └── screen/
        └── home/
            ├── provider/   # MediaProvider (AudioPlayer lifecycle, playback state)
            ├── widget/     # PlayerController, SongListItem
            └── home_screen.dart
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `AudioPlayer` owned exclusively by `MediaProvider` | Centralizes lifecycle management; widgets never touch the player directly |
| Circular index arithmetic `(i ± 1 + n) % n` | Handles wrap-around without conditional branches in next/previous methods |
| `_setAudioSource` separates load from play | Allows preloading the first track silently without starting playback on launch |
| Duration set from model immediately on song change | UI shows the correct total time before the audio engine confirms it asynchronously |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `provider` | ^6.1.5+1 | State management |
| `audioplayers` | ^6.6.0 | Audio streaming and playback control |
| `http` | ^1.6.0 | URL resolution for remote audio sources |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)
- An active internet connection (songs stream from remote URLs)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/music_player.git
   cd music_player
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

### Run Commands

| Platform | Command |
|---|---|
| Android | `flutter run` (with Android emulator or device connected) |
| iOS | `flutter run` (with iOS Simulator or device, requires macOS) |
| List devices | `flutter devices` |

**iOS — additional step (first time only):**

```bash
cd ios
pod install
cd ..
flutter run
```

---

## Project Structure

```
music_player/
├── lib/
│   ├── main.dart                              # App entry point and MaterialApp setup
│   ├── core/
│   │   └── constants/
│   │       ├── app_colors.dart                # Centralized color palette
│   │       └── app_strings.dart               # All UI strings and app name
│   ├── data/
│   │   └── model/
│   │       └── song_model.dart                # Static sample playlist with stream URLs
│   ├── domain/
│   │   └── entities/
│   │       └── song.dart                      # Pure Song entity
│   └── presentation/
│       └── screen/
│           └── home/
│               ├── home_screen.dart           # AppBar + PlayerController + song list
│               ├── provider/
│               │   └── media_provider.dart    # AudioPlayer lifecycle and playback state
│               └── widget/
│                   ├── player_controller.dart # Play/pause, prev/next, seek slider
│                   └── song_list_item.dart    # Individual track row with selection state
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Launch** — The home screen shows the player controller at the top and the full playlist below. The first song is pre-loaded but not playing.
2. **Tap a song** — `MediaProvider.playSongAtIndex` loads the selected track and starts streaming immediately.
3. **Play / Pause** — Tap the play/pause button in the controller to toggle playback.
4. **Skip** — Tap next or previous to move through the playlist; it wraps around at both ends.
5. **Seek** — Drag the progress slider to jump to any point in the current track.
6. **Auto-advance** — When a song ends, the player automatically loads and plays the next track.

---

## Contributing

This is an educational project. Feel free to fork and experiment!

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m "feat: describe your change"`
4. Push to your branch: `git push origin feature/your-feature-name`
5. Open a Pull Request.

Please keep pull requests focused and well-described.

---

## License

This project is created for educational purposes as part of **Ostad Batch 14**.
