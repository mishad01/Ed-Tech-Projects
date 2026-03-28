# YouTube Lite

A lightweight Flutter application that wraps the YouTube mobile web experience in a clean, dark-themed native shell. Built as a learning project to demonstrate WebView integration, feature-based architecture, and Material 3 theming in Flutter.

---

## Preview

> _Screenshot placeholder — run the app locally to see the UI._
>
---

## Features

- **Sectioned navigation hub** — Browse, Library, and More sections organized with labeled group headers.
- **In-app WebView player** — Each navigation item opens YouTube's mobile site inside a native WebView with a loading overlay, keeping the user in-app.
- **Dark-themed Material 3 UI** — Consistent dark color scheme and YouTube-brand primary color applied through a centralized theme.
- **Centralized constants** — All strings, colors, and URLs are extracted into dedicated constant classes, eliminating magic values across the codebase.
- **Reusable navigation tile widget** — A single `YoutubeNavTile` component powers every list item, ensuring visual consistency.

---

## Architecture

The project follows a **feature-based presentation layer** built on top of a shared `core` layer. There is no external state management library; Flutter's built-in `StatefulWidget` handles the minimal local state required.

```
App
├── core/           # Shared constants and utilities (colors, strings, URLs)
└── presentation/   # UI layer, organized by feature
    ├── core/       # Shared widgets used across features (WebViewWrapper, LoadingOverlay)
    ├── home/       # Home feature (screen + navigation tile widget)
    └── youtube/    # YouTube WebView feature (screen)
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| Static-only constant classes with private constructors | Prevents accidental instantiation; keeps constants namespace-safe |
| `YoutubeScreen` delegates entirely to `WebViewWrapper` | Separates routing concerns from WebView lifecycle management |
| All URLs centralized in `YoutubeUrls` | Single place to update endpoints without touching UI code |
| `MaterialApp` theme configured at root | Ensures consistent color scheme and AppBar styling app-wide |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `webview_flutter` | ^4.13.1 | Embedded WebView for YouTube mobile web |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)

> **Note:** The `webview_flutter` package requires Android API level 19+ and iOS 11.0+.

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/youtube_lite.git
   cd youtube_lite
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
youtube_lite/
├── lib/
│   ├── main.dart                          # App entry point and MaterialApp setup
│   ├── core/
│   │   └── constants/
│   │       ├── app_colors.dart            # Centralized color palette
│   │       ├── app_strings.dart           # All UI strings and category labels
│   │       └── youtube_urls.dart          # YouTube mobile URLs per section
│   └── presentation/
│       ├── core/
│       │   └── widget/
│       │       ├── web_view_wrapper.dart          # WebView + AppBar scaffold
│       │       └── full_screen_loading_overlay.dart  # Loading state widget
│       ├── home/
│       │   ├── screen/
│       │   │   └── home_screen.dart       # Main navigation list screen
│       │   └── widget/
│       │       └── youtube_nav_tile.dart  # Reusable navigation list tile
│       └── youtube/
│           └── screen/
│               └── youtube_screen.dart    # Thin screen delegating to WebViewWrapper
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Launch the app** — The `HomeScreen` renders three grouped sections: BROWSE, LIBRARY, and MORE.
2. **Tap a navigation tile** — Each `YoutubeNavTile` calls `_openUrl`, which pushes a `YoutubeScreen` onto the navigation stack.
3. **WebView loads** — `WebViewWrapper` initializes a `WebViewController`, navigates to the target YouTube mobile URL, and shows a full-screen loading overlay while the page loads.
4. **Navigate back** — The native AppBar back button pops the WebView screen and returns the user to the navigation hub.

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

This project is created for educational purposes as part of **Ostad Batch 13**.

It is not affiliated with or endorsed by YouTube or Google. All YouTube content accessed through this app is subject to [YouTube's Terms of Service](https://www.youtube.com/t/terms).
