# Local Event Finder

A Flutter event discovery app that lists local events and navigates to a detail view featuring an interactive Google Map. Built to practice list/detail navigation, Provider state management, hero animations, and Google Maps integration.

<img width="800" alt="Local Event Finder Screenshots" src="local%20event%20finder.png" />

## Features

- **Event list** — Scrollable feed of events loaded via a service layer, each card showing the title, category badge, date, and cover image.
- **Category color coding** — Each event category (Music, Technology, Food, Art, Sports, etc.) renders a distinct badge color for quick visual scanning.
- **Event detail screen** — Full-screen detail view with hero image transition, date, location, and a rich description.
- **Interactive Google Map** — An embedded `google_maps_flutter` map pins the exact venue coordinates on the detail page.
- **Loading and error states** — Provider surfaces loading spinners and error messages while the service layer is at work.
- **Splash screen** — Branded intro before landing on the event list.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core` and clean `domain`/`data` separation. There is no external state management beyond Provider.

```
App
├── core/                       # Category color mapping utility
├── data/
│   └── service/                # EventService (static dummy data, simulates async fetch)
├── domain/
│   └── entities/               # Event
└── presentation/
    ├── provider/               # EventProvider (load, error, and event list state)
    └── screens/
        ├── splash/             # SplashScreen
        ├── home/               # HomeScreen + EventCard widget
        └── event/              # EventDetails screen + EventMapWidget
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `EventService` returns `Future<List<Event>>` with a simulated delay | Mimics a real async API call so the loading/error UI path is exercised |
| `Hero` tag tied to `event.id` | Guarantees unique, conflict-free hero transitions when multiple events are visible |
| `EventMapWidget` isolated in its own file | Separates the Google Maps lifecycle from the detail screen's scroll logic |
| `getCategoryColor` centralized in `core` | Single place to add or change category colors without touching any screen |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `provider` | ^6.1.5+1 | State management |
| `google_maps_flutter` | ^2.17.0 | Embedded interactive map |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)
- A Google Maps API key enabled for both Android and iOS

> **Note:** Add your Maps API key to `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift` before running on device.

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/local_event_finder.git
   cd local_event_finder
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
local_event_finder/
├── lib/
│   ├── main.dart                              # App entry point
│   ├── core/
│   │   └── category_color.dart               # Category → Color mapping function
│   ├── data/
│   │   └── service/
│   │       └── event_service.dart            # Dummy event data with async simulation
│   ├── domain/
│   │   └── entities/
│   │       └── event.dart                    # Event entity (id, title, date, location, lat/lng, category)
│   └── presentation/
│       ├── provider/
│       │   └── event_provider.dart           # Loads events, exposes loading/error state
│       └── screens/
│           ├── splash/
│           │   └── splash_screen.dart
│           ├── home/
│           │   ├── home_screen.dart
│           │   └── widget/
│           │       └── event_card.dart       # Category badge, cover image, date row
│           └── event/
│               ├── event_details.dart        # Hero image, description, map section
│               └── widget/
│                   └── event_map_widget.dart # google_maps_flutter marker view
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Splash** — Branding screen auto-navigates to the event list.
2. **Home** — `EventProvider.loadEvent()` is called on init; a loading spinner shows until the data resolves.
3. **Tap an event card** — Navigates to `EventDetails` with a hero image transition.
4. **Detail page** — Shows the cover image, category badge, date, location, description, and a full-width Google Map pinpointing the venue.
5. **Back** — Native back button returns to the event list.

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

This project is created for educational purposes as part of the **Ostad Flutter course**.
