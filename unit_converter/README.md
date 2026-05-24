# Unit Converter

A minimal Flutter unit conversion app supporting Length, Weight, and Temperature categories. Built to demonstrate clean Provider-driven reactive state, a self-contained conversion engine, and a fully composable widget layout — with no third-party math libraries.

<img width="250" alt="Unit Converter Screenshot" src="https://github.com/user-attachments/assets/eb38497c-bdc1-46fa-8297-033376d9ba53" />

## Features

- **Three categories** — Length (Meter, Kilometer, Mile, Foot, Inch, Centimeter), Weight (Kilogram, Gram, Pound, Ounce), and Temperature (Celsius, Fahrenheit, Kelvin).
- **Category selector** — Chip-style row that switches the active unit set instantly.
- **From / To dropdowns** — Independent unit selectors with a swap button to reverse the conversion direction in one tap.
- **Live conversion** — Result updates reactively as you type without any submit button.
- **Smart number formatting** — Trailing zeros and dangling decimal points are trimmed from the output.
- **Self-contained conversion engine** — All conversion formulas live in `UnitCategoryModel`; no external packages required.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core` and clean `domain`/`data` separation.

```
App
├── core/               # AppColors, AppStrings (labels, hints)
├── data/
│   └── model/          # UnitCategoryModel (static category data + all conversion logic)
├── domain/
│   └── entities/       # UnitCategory (pure entity: name, icon, unit list)
└── presentation/
    ├── provider/       # ConverterProvider (selected category, units, input, result)
    └── screen/
        ├── converter_screen.dart
        └── widget/     # CategorySelector, InputField, UnitDropdown, ResultCard
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| All conversion math in `UnitCategoryModel` | Keeps the provider thin; formulas are testable independently of any Flutter widget |
| Length and Weight convert via an intermediate base unit (meters / kg) | Avoids an N×N conversion table; adding a new unit only requires two new cases |
| `ConverterProvider.result` is a computed getter | No separate state field to keep in sync; recomputes on every rebuild |
| `swap()` method on the provider | Encapsulates the unit reversal; the UI just calls one method |

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
   git clone https://github.com/<your-username>/unit_converter.git
   cd unit_converter
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
unit_converter/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   ├── data/
│   │   └── model/
│   │       └── unit_category_model.dart   # Static categories + full conversion engine
│   ├── domain/
│   │   └── entities/
│   │       └── unit_category.dart
│   └── presentation/
│       ├── provider/
│       │   └── converter_provider.dart
│       └── screen/
│           ├── converter_screen.dart
│           └── widget/
│               ├── category_selector.dart
│               ├── input_field.dart
│               ├── unit_drop_down.dart
│               └── result_card.dart
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Select a category** — Tap a chip (Length, Weight, or Temperature) to switch the active unit set.
2. **Enter a value** — Type a number in the input field. The result card updates instantly.
3. **Choose units** — Select the source unit in the "From" dropdown and the target unit in the "To" dropdown.
4. **Swap** — Tap the swap icon to reverse From and To in one tap.
5. **Read the result** — The result card shows the converted value with trailing zeros removed.

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
