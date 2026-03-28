# Lottery App 🎰

A simple Flutter lottery application built with Clean Architecture principles.

## Features

- Enter your name and select a lucky number (1-10)
- Instant lottery draw with random number generation
- Win/lose results with visual feedback
- Play again functionality

## Architecture

This app follows **Clean Architecture** with three layers:

- **Domain Layer**: Business logic and entities
- **Data Layer**: Repository implementation
- **Presentation Layer**: UI screens and state management

## Tech Stack

- **Flutter** - UI framework
- **Provider** - State management
- **Dart** - Programming language

## Getting Started

### Prerequisites

- Flutter SDK (3.10.8 or higher)
- Dart SDK
- IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone or download this project
2. Navigate to project directory:
   ```bash
   cd lottery_test
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

### Running on Different Platforms

```bash
# macOS
flutter run -d macos

# Chrome (Web)
flutter run -d chrome

# iOS Simulator
flutter run -d ios

# Android Emulator
flutter run -d android
```

## Project Structure

```
lib/
├── domain/              # Business Logic
│   ├── entities/        # LotteryResult
│   └── usecases/        # PlayLotteryUseCase
├── data/                # Data Layer
│   └── repositories/    # LotteryRepositoryImpl
└── presentation/        # UI Layer
    ├── core/            # Shared UI components
    ├── providers/       # LotteryProvider (State Management)
    └── screens/         # HomeScreen, EntryScreen, ResultScreen
```

## How to Play

1. **Home Screen**: Click "Play Lottery"
2. **Entry Screen**: 
   - Optionally enter your name
   - Select a number (1-10)
   - Click "Submit"
3. **Result Screen**: 
   - View your number vs winning number
   - See if you won! 🎉
   - Click "Try Again" to replay

## Contributing

This is an educational project. Feel free to fork and experiment!

## License

This project is created for educational purposes as part of Ostad Batch 11.
