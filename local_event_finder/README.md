# Local Event Finder

A Flutter event discovery app that lists local events and navigates to a detail view featuring an interactive Google Map. Built to practice list/detail navigation, Provider state management, and Google Maps integration.

<img width="800" alt="Local Event Finder Screenshots" src="local%20event%20finder.png" />

## Features

- **Event list** — Scrollable feed of events loaded via a service layer, each card showing the title, category badge, date, and cover image.
- **Category color coding** — Each event category renders a distinct color for quick visual scanning.
- **Event detail screen** — Full detail view with cover image, date/time, location, and a rich description.
- **Info cards** — Date & Time and Location displayed in dedicated info card widgets.
- **Interactive Google Map** — An embedded `google_maps_flutter` map pins the exact venue coordinates on the detail page.
- **Loading and error states** — Provider surfaces loading spinners and error messages while the service is at work.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core` and clean `domain`/`data` separation.

```
App
├── core/                       # App-wide colors and string constants
├── data/
│   ├── models/                 # EventModel (static sample data)
│   └── service/                # EventService (async fetch simulation)
├── domain/
│   └── entities/               # Event
└── presentation/
    ├── core/
    │   └── utils/              # Category color mapping utility
    ├── provider/               # EventProvider (load, error, and event list state)
    ├── screen/                 # EventListScreen, EventDetailsScreen
    └── widget/                 # EventMapWidget, InfoCard
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `EventModel` holds static sample data | Simulates a real API response without a network dependency |
| `EventService` returns `Future` with a short delay | Exercises the loading/error UI path as if hitting a real endpoint |
| `InfoCard` widget for date and location | Reusable card component keeps the detail screen declarative |
| Category color utility in `presentation/core/utils` | Keeps color mapping close to the UI without polluting the domain layer |

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
│   │   ├── app_colors.dart                    # Centralized color palette
│   │   └── app_strings.dart                   # All UI strings
│   ├── data/
│   │   ├── models/
│   │   │   └── event_model.dart               # Static sample events
│   │   └── service/
│   │       └── event_service.dart             # Async fetch with simulated delay
│   ├── domain/
│   │   └── entities/
│   │       └── event.dart                     # Event entity (id, title, date, location, lat/lng, category)
│   └── presentation/
│       ├── core/
│       │   └── utils/
│       │       └── category_color.dart        # Category → Color mapping
│       ├── provider/
│       │   └── event_provider.dart            # Loads events, exposes loading/error state
│       ├── screen/
│       │   ├── event_list_screen.dart         # Scrollable event feed
│       │   └── event_details_screen.dart      # Detail view with map
│       └── widget/
│           ├── event_map_widget.dart          # google_maps_flutter marker view
│           └── info_card.dart                 # Reusable date/location info card
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Home** — `EventProvider.fetchEvents()` is called on init; a loading spinner shows until the data resolves.
2. **Tap an event card** — Navigates to `EventDetailsScreen`.
3. **Detail page** — Shows the cover image, category badge, info cards for date/time and location, a description, and a full-width Google Map pinpointing the venue.
4. **Back** — Native back button returns to the event list.

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
