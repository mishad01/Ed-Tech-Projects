# bKash Dummy App

A pixel-faithful Flutter UI clone of the bKash mobile banking app, built to demonstrate screen-based navigation, feature-based architecture, and Provider-driven state management.

<img height="500" alt="Screenshot 2026-02-23 at 1 22 56 PM" src="https://github.com/user-attachments/assets/5b632ab9-16a5-4942-b0b2-daaf96d7ae1a" />


## Features

- **Splash screen** — Auto-navigates to the login screen after a brief delay.
- **Login screen** — Phone number input, obscured PIN field with fingerprint icon, and a language toggle (Bangla/English).
- **16-item service grid** — Full set of bKash home menu actions: Send Money, Mobile Recharge, Cash Out, Make Payment, Add Money, Pay Bill, Savings, Loan, Insurance, bKash to Bank, Education Fee, Microfinance, Toll, Request Money, Remittance, and Donation.
- **Collapsible grid** — Shows 8 items by default; a toggle expands to reveal all 16.
- **Branded offer banner** — Static promotional image displayed below the service grid.
- **Centralized constants** — All colors and strings extracted into dedicated classes, eliminating magic values.

---

## Architecture

The project follows a **feature-based presentation layer** over a shared `core`, `data`, and `domain` layer. Provider handles the minimal state required for grid expansion.

```
App
├── core/                       # App-wide colors and string constants
├── data/
│   └── model/                  # HomeMenuItemModel (static sample data + fromMap)
├── domain/
│   └── entities/               # HomeMenuItem (pure domain entity)
└── presentation/
    └── screens/
        ├── splash/             # SplashScreen
        ├── login/              # LoginScreen
        └── home/
            ├── provider/       # HomeProvider (expand/collapse state)
            ├── view/           # HomeScreen
            └── widget/         # HomeAppBar, MenuGrid, MenuGridItem, QuickFeatureSection
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| `HomeMenuItemModel` extends `HomeMenuItem` | Separates serialization logic from the pure domain entity |
| `HomeProvider.visibleItems` computed from a flag | Single toggle drives both the grid state and the expand button label |
| All strings in `AppStrings` | Language-switch readiness — swap one class to localize |
| Static sample data in the model | Simulates a real API response without a network dependency |

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
   git clone https://github.com/<your-username>/bkash_dummy_app.git
   cd bkash_dummy_app
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
bkash_dummy_app/
├── lib/
│   ├── main.dart                              # App entry point and MaterialApp setup
│   ├── core/
│   │   ├── app_colors.dart                    # Centralized color palette
│   │   └── app_strings.dart                   # All UI strings and labels
│   ├── data/
│   │   └── model/
│   │       └── home_menu_item_model.dart      # Data model + 16 sample menu items
│   ├── domain/
│   │   └── entities/
│   │       └── home_menu_item.dart            # Pure domain entity
│   └── presentation/
│       └── screens/
│           ├── splash/
│           │   └── splash_screen.dart
│           ├── login/
│           │   └── login_screen.dart
│           └── home/
│               ├── provider/
│               │   └── home_provider.dart     # Grid expand/collapse state
│               ├── view/
│               │   └── home_screen.dart
│               └── widget/
│                   ├── home_app_bar.dart
│                   ├── menu_grid.dart
│                   ├── menu_grid_item.dart
│                   └── quick_feature_section.dart
├── assets/
│   ├── bkash.png
│   └── offfer_banner.png
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Splash** — App launches and auto-navigates to the Login screen.
2. **Login** — Enter any phone number and tap the PIN field; tap **Log In** to proceed (no real authentication in this dummy app).
3. **Home grid** — The 8 primary service tiles are visible immediately.
4. **Expand** — Tap the toggle to reveal all 16 service items.
5. **Offer banner** — A static promotional banner is displayed below the grid.

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

It is not affiliated with or endorsed by bKash Limited.
