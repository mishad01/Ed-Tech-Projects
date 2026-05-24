# Lottery App

A simple Flutter lottery game built with Clean Architecture principles. Enter your name, pick a lucky number, and see if you win — built to demonstrate layered architecture, Provider state management, and multi-screen navigation.

<td align="center">
  <img src="https://github.com/user-attachments/assets/2bdcaa83-62bd-4fbc-84c3-e288ad209147" width="250" />
</td>

## Features

- **Name entry** — Optionally enter your name before playing.
- **Number picker** — Choose a lucky number between 1 and 10 using a visual tile grid.
- **Lottery draw** — Instant random number generation against your pick.
- **Result screen** — Win/lose outcome displayed with a result icon and number comparison cards.
- **Play again** — One-tap reset back to the entry screen.

---

## Architecture

The project follows **Clean Architecture** with three distinct layers and no cross-layer leakage.

```
App
├── core/               # App-wide colors and string constants
├── domain/
│   └── entities/       # LotteryResult (pure data, no Flutter dependency)
├── data/               # Repository layer (expandable for future persistence)
└── presentation/
    ├── provider/       # LotteryProvider (state: name, selected number, result)
    ├── screen/         # HomeScreen, EntryScreen, ResultScreen
    └── widget/         # Shared UI components
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `LotteryResult` lives in the domain layer | Business data stays framework-free and independently testable |
| `LotteryProvider` owns all game state | Single source of truth; screens only read and dispatch actions |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `provider` | ^6.1.5+1 | State management |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/lottery_app.git
   cd lottery_app
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
| macOS | `flutter run -d macos` |
| Chrome (Web) | `flutter run -d chrome` |
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
lottery_app/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   ├── domain/
│   │   └── entities/
│   │       └── lottery_result.dart
│   └── presentation/
│       ├── provider/
│       │   └── lottery_provider.dart
│       ├── screen/
│       │   ├── home_screen.dart
│       │   ├── entry_screen.dart
│       │   └── result_screen.dart
│       └── widget/
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Home Screen** — Tap **Play Lottery** to begin.
2. **Entry Screen** — Optionally enter your name, then tap a number tile (1–10) to select your pick. Tap **Submit**.
3. **Result Screen** — See your number vs the randomly generated winning number. Tap **Try Again** to replay.

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

This project is created for educational purposes as part of **Ostad Batch 12**.
