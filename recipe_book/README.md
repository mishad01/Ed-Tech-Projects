# Recipe Book App
<img width="600" alt="Screenshot 2026-02-28 at 11 53 00 AM" src="https://github.com/user-attachments/assets/4ff24dc4-9407-4dca-9980-423a04dbd392" />


A beautiful and responsive recipe application built with Flutter. This app allows users to discover new recipes, view detailed cooking instructions, and manage their favorite dishes efficiently. 

## Features

- **Browse Recipes**: Easily scroll through a wide variety of recipes on an intuitive Home Screen.
- **Detailed Instructions**: View comprehensive recipe details, including ingredients lists and step-by-step cooking instructions rendered elegantly.
- **Image Caching**: Fast and offline-ready image loading utilizing cached network images.
- **Clean UI/UX**: A modern, clean, and responsive user interface tailored for an optimal viewing experience.

## Architecture

This project follows **Clean Architecture** principles to separate concerns and ensure maintainability:

- **Core**: Contains common utilities, constants, and extensions used across the application.
- **Domain**: Holds business logic and core entities. It is completely independent of other layers.
- **Data**: Manages data sources, APIs, and models (e.g., parsing JSON to models).
- **Presentation**: UI layer containing screens, widgets, and state management logic.

## Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Networking**: `http`
- **Image Caching**: `cached_network_image`
- **Local Storage**: `shared_preferences`
- **HTML Rendering**: `flutter_html`

### State Management
- **Provider**: Used to handle the state seamlessly across the application.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

Ensure you have the following installed:
- **Flutter SDK**: `^3.10.8` or newer
- **Dart SDK**: `^3.10.8` or newer
- **IDE**: Android Studio, VS Code, or IntelliJ IDEA

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd reciepe_test_app
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```

### Run Commands

To run the application on a connected device or emulator:

**iOS / Android (Mobile):**
```bash
flutter run
```

**Web (if enabled):**
```bash
flutter run -d chrome
```

## Project Structure

```text
lib/
├── core/                 # Utility classes, constants, and overall settings
├── data/                 # API calls, models, and data manipulation
│   ├── models/           # Data models (e.g., RecipeModel)
│   └── services/         # External service interactions
├── domain/               # Business logic and entities
│   └── entities/         # Core business objects
├── presentation/         # UI components and state management
│   ├── provider/         # Provider logic and state handlers
│   ├── screen/           # App screens (HomeScreen, RecipeDetailsScreen, etc.)
│   └── widget/           # Reusable UI widgets (RecipeCard, etc.)
└── main.dart             # Application entry point
```

## Usage / How It Works

1. **Launch the App:** Open the app to land on the `HomeScreen`, presenting a list of curated recipes.
2. **Discover:** Scroll through the list of recipes utilizing the styled `RecipeCard` widgets.
3. **View Details:** Tap on any recipe card to navigate to the `RecipeDetailsScreen` to view ingredients and cooking processes.


Recipe Book App 
Figma - https://www.figma.com/design/C5vvhSwhM8nWio8xrVMzu3/Food-Recipe-Mobile-App--Community-?node-id=1-3&p=f&t=lmJpUxpuT3tzaEQn-0
Api - https://spoonacular.com/food-api

## Contributing

This is an educational project. Feel free to fork and experiment!

## License

This project is created for educational purposes as part of Ostad Batch 12.
