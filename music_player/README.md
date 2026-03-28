# Music Player

## Features
- **Top Player Section**: View current song details, control playback, and scrub through the track with a progress slider.
- **Song List**: Browse available songs with their track number, title, and artist.
- **Seamless Playback**: Instant playback updates when selecting a song from the list, with state synchronized across the app.
- **Audio Controls**: Play, pause, skip forward, or go back to the previous track effortlessly.

## Architecture
This project follows **Clean Architecture** combined with a **Feature-based** folder structure. It enforces a strict separation of concerns into distinct layers:
- **Core**: Contains app-wide constants (colors, strings, etc.) and shared utilities.
- **Domain**: Houses core business logic and entities (e.g., `Song` object).
- **Data**: Manages data models and data sources (e.g., hardcoded sample songs).
- **Presentation**: Manages the UI layer, organized by screen/feature (e.g., `home`), including its widgets and state providers.

## Tech Stack
- **Flutter** & **Dart**
- **audioplayers**: Core engine for audio playback.
- **http**: For resolving external media URLs.
- **provider**: For robust, reactive state management.

## Getting Started

### Prerequisites
- Flutter SDK `^3.10.8` or later.
- Dart SDK `^3.1.0` or later.
- A compatible IDE (VS Code, Android Studio, or IntelliJ IDEA).

### Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd music_player
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Run Commands
Run the app on your preferred platform:

**Android / iOS (Mobile):**
```bash
flutter run
```
**Web:**
```bash
flutter run -d chrome
```

## Project Structure
```text
lib/
├── core/
│   └── constants/                 # AppColors, AppStrings
├── data/
│   └── model/                     # Data transfer objects (SongModel)
├── domain/
│   └── entities/                  # Core business models (Song)
├── presentation/
│   └── screen/
│       └── home/                  # Home feature
│           ├── provider/          # State management (MediaProvider)
│           ├── widget/            # Reusable UI components (PlayerController, SongListItem)
│           └── home_screen.dart   # Main screen UI
└── main.dart                      # App entry point
```

## Usage / How It Works
1. **Launch**: Open the app to view the comprehensive media player interface.
2. **Browse**: Scroll through the list of available audio tracks in the bottom section.
3. **Play**: Tap any song to instantly load and start playback.
4. **Control**: Use the top player section to pause/play, skip, or drag the progress slider to seek through the active track.

## Contributing
This is an educational project. Feel free to fork and experiment!

## License
This project is created for educational purposes as part of Ostad Batch 11.
