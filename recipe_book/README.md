# Recipe Book

A Flutter recipe discovery app powered by the Spoonacular API. Filter recipes by cuisine category, search by keyword, and browse results with cached cover images — built to practice API integration, category-driven filtering, and cached network image loading.

<img width="800" alt="Recipe Book Screenshots" src="recipe book.png" />

## Features

- **Cuisine category filter** — Horizontal chip bar with categories (All, Italian, Chinese, Mexican, Indian, French, Japanese); tapping a chip refetches recipes filtered by that cuisine.
- **Recipe card feed** — Horizontally scrolling recipe cards with cached cover images, title, and metadata.
- **Search screen** — Keyword-based recipe search using Spoonacular's `complexSearch` endpoint.
- **Persistent image caching** — `cached_network_image` keeps downloaded images in memory and on disk.
- **HTML content rendering** — `flutter_html` renders recipe instruction markup returned by the API.
- **Favorites stub** — Heart icon in the AppBar shows a "coming soon" dialog, ready to be wired up.
- **Profile avatar** — Circular avatar in the AppBar loaded from a remote URL via `CachedNetworkImage`.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core` and clean `domain`/`data` separation.

```
App
├── core/               # AppColors, AppStrings (API key, base URL, profile image URL)
├── data/
│   ├── model/          # RecipeModel (JSON deserialization)
│   └── service/        # ApiService (by category, keyword search)
├── domain/
│   └── entities/       # Recipe (pure domain entity)
└── presentation/
    ├── provider/       # RecipeProvider (category recipes, search results, loading state)
    └── screen/
        ├── home_screen.dart
        ├── search_screen.dart
        └── widget/     # RecipeCard
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `WidgetsBinding.instance.addPostFrameCallback` in `initState` | Defers the initial Provider fetch until after the first frame to avoid build-phase side effects |
| Category filter calls `fetchRecipesByCategory` on every tap | Keeps the displayed list in sync with the selected chip without a local cache to manage |
| `CachedNetworkImage` used for both avatar and recipe covers | Single dependency handles both use cases; avoids duplicating image-loading logic |
| `flutter_html` for recipe content | Handles arbitrary HTML returned by Spoonacular without custom parsing |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `provider` | ^6.1.5+1 | State management |
| `http` | ^1.6.0 | HTTP client for Spoonacular API calls |
| `cached_network_image` | ^3.4.1 | Persistent image caching |
| `flutter_html` | ^3.0.0 | HTML recipe content rendering |
| Spoonacular API | v1 | Recipe data source |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)
- A [Spoonacular API key](https://spoonacular.com/food-api)

> **Note:** Add your Spoonacular API key to `lib/core/app_strings.dart` (`AppStrings.apiKey`) before running.

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/recipe_book.git
   cd recipe_book
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
recipe_book/
├── lib/
│   ├── main.dart                          # App entry point and MaterialApp setup
│   ├── core/
│   │   ├── app_colors.dart                # Centralized color palette
│   │   └── app_strings.dart               # API key, base URL, profile image URL
│   ├── data/
│   │   ├── model/
│   │   │   └── recipe_model.dart          # JSON deserialization model
│   │   └── service/
│   │       └── api_service.dart           # Spoonacular category and search calls
│   ├── domain/
│   │   └── entities/
│   │       └── recipe.dart                # Pure Recipe entity
│   └── presentation/
│       ├── provider/
│       │   └── recipe_provider.dart       # Category recipes, search results, loading state
│       └── screen/
│           ├── home_screen.dart           # Category chips + horizontal recipe feed
│           ├── search_screen.dart         # Keyword search with results list
│           └── widget/
│               └── recipe_card.dart       # Cached image card with title and metadata
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Launch** — Home screen loads with the "All" category selected and a full recipe list.
2. **Filter by cuisine** — Tap any chip in the horizontal bar; the list refetches and updates instantly.
3. **Search** — Tap the search icon in the AppBar to open `SearchScreen`. Type a keyword to query Spoonacular.
4. **Favorites** — Tap the heart icon to see the "coming soon" placeholder dialog.
5. **Back** — Native back button returns to the home screen from any sub-screen.

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

It is not affiliated with or endorsed by Spoonacular. All recipe data is sourced from the [Spoonacular Food API](https://spoonacular.com/food-api).
