# Movie Review App

A Flutter movie discovery app powered by the TMDB API. Browse this week's trending titles, view full movie details, and search by title — built to demonstrate REST API integration, Provider state management, and background JSON parsing.

<img width="800" alt="Movie Review App Screenshots" src="movie review.png" />

## Features

- **Trending movies feed** — Fetches the weekly trending list from TMDB on launch and displays it in a scrollable card list.
- **Movie detail screen** — Poster, title, rating, release date, and overview loaded per movie.
- **Search** — Real-time title search using TMDB's `/search/movie` endpoint.
- **Background JSON parsing** — Movie detail responses are decoded off the main thread using Flutter's `compute()`.
- **Splash screen** — Branded intro before landing on the home feed.
- **Centralized API layer** — All TMDB base URLs, auth tokens, and headers are managed in a single `ApiService` and `AppStrings`.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core` and clean `domain`/`data` separation.

```
App
├── core/               # AppColors, AppStrings (base URL, auth token)
├── data/
│   ├── model/          # MovieModel (JSON deserialization)
│   └── service/        # ApiService (trending, search, details endpoints)
├── domain/
│   └── entities/       # Movie (pure domain entity)
└── presentation/
    ├── provider/       # MovieProvider (trending list, search results, loading state)
    └── screens/        # SplashScreen, HomeScreen, MovieCard, MovieDetails, SearchScreen
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `MovieModel` extends `Movie` | Keeps JSON parsing in the data layer; domain entity stays framework-free |
| `compute(parseMovieDetails, body)` in `getMovieDetails` | Offloads JSON decoding to an isolate, preventing jank on large detail payloads |
| `Future.microtask` for initial fetch in `HomeScreen.initState` | Defers the Provider call until the first frame is built, avoiding `setState` during build |
| Auth token centralized in `AppStrings` | Single place to rotate the TMDB token without touching any screen |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `provider` | ^6.1.5+1 | State management |
| `http` | ^1.6.0 | HTTP client for TMDB API calls |
| TMDB API | v3 | Movie data source |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)
- A [TMDB API key](https://www.themoviedb.org/settings/api)

> **Note:** Add your TMDB Bearer token to `lib/core/app_strings.dart` (`AppStrings.authorizationToken`) before running.

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/movie_review_app.git
   cd movie_review_app
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
movie_review_app/
├── lib/
│   ├── main.dart                          # App entry point and MaterialApp setup
│   ├── core/
│   │   ├── app_colors.dart                # Centralized color palette
│   │   └── app_strings.dart               # Base URL, auth token, UI strings
│   ├── data/
│   │   ├── model/
│   │   │   └── movie_model.dart           # JSON deserialization model
│   │   └── service/
│   │       └── api_service.dart           # TMDB trending, search, and details calls
│   ├── domain/
│   │   └── entities/
│   │       └── movie.dart                 # Pure Movie entity
│   └── presentation/
│       ├── provider/
│       │   └── movie_provider.dart        # Trending list, search results, loading state
│       └── screens/
│           ├── splash_screen.dart
│           ├── home_screen.dart           # Trending feed + search navigation
│           ├── movie_card.dart            # Reusable movie list tile
│           ├── movie_details.dart         # Full movie detail view
│           └── search_screen.dart         # Title search with results list
├── assets/
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Splash** — Branding screen auto-navigates to the home feed.
2. **Home** — `MovieProvider.fetchTrendingMovies()` fires on init, loading this week's trending titles from TMDB.
3. **Tap a movie card** — Pushes `MovieDetails`, which displays the poster, overview, and metadata.
4. **Search** — Tap the search icon in the AppBar to open `SearchScreen`. Type a title to query TMDB's search endpoint.
5. **Back** — Native back button returns to the previous screen.

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

It is not affiliated with or endorsed by TMDB. All movie data is sourced from [The Movie Database API](https://www.themoviedb.org/).
