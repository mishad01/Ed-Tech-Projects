# Unit Converter App

A clean and minimal **Flutter** application that converts values across multiple physical unit categories — Length, Weight, and Temperature — powered by a `Provider`-based architecture and a well-structured, layered codebase.

---

## Features

- **Length** — Meter, Kilometer, Mile, Foot, Inch, Centimeter
- **Weight** — Kilogram, Gram, Pound, Ounce
- **Temperature** — Celsius, Fahrenheit, Kelvin
- Swap "From" and "To" units with a single tap
- Real-time conversion as you type
- Themed with Material 3 color system

---

## Project Structure

```
lib/
├── core/
│   ├── app_colors.dart        # Centralized color constants
│   └── app_strings.dart       # All static UI text strings
├── data/
│   └── models/
│       └── unit_category_model.dart   # Data model + conversion logic
├── domain/
│   └── entities/
│       └── unit_category.dart         # Abstract entity class
├── presentation/
│   ├── provider/
│   │   └── converter_provider.dart    # State management (ChangeNotifier)
│   ├── screen/
│   │   └── converter_screen.dart      # Main screen
│   └── widget/
│       ├── category_selector.dart     # Category chip selector
│       ├── input_field.dart           # Numeric input
│       ├── result_card.dart           # Conversion result display
│       └── unit_drop_down.dart        # From / To unit dropdowns
└── main.dart
```

---

## Architecture

The app follows a **layered architecture** pattern:

| Layer | Responsibility |
|---|---|
| `domain` | Abstract entities — pure Dart, no dependencies |
| `data` | Concrete models extending domain entities + conversion math |
| `presentation` | UI widgets, screens, and Provider-based state |
| `core` | Shared constants (colors, strings) used across all layers |

State is managed with **Provider** (`ChangeNotifierProvider`), keeping the UI fully reactive and decoupled from business logic.

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) >= 3.10.x
- Dart SDK `^3.10.8`

### Run Locally

```bash
# Clone the repository
git clone <your-repo-url>
cd uni_converter_app

# Install dependencies
flutter pub get

# Run in debug mode
flutter run
```

### Build

```bash
# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release
```

---

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| [provider](https://pub.dev/packages/provider) | `^6.1.5` | State management |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | `^1.0.8` | iOS-style icons |
| [flutter_lints](https://pub.dev/packages/flutter_lints) | `^6.0.0` | Lint rules (dev) |

---


## Contributing

This is an educational project. Feel free to fork and experiment!

## License

This project is created for educational purposes as part of Ostad Batch 12.
