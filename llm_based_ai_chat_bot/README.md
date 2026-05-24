# LLM-Based AI Chat Bot

An AI-powered Flutter chat application backed by an LLM API, with a companion AI image generation tab. Built to demonstrate multi-provider state management, REST API integration, and feature-based architecture in Flutter.

<img width="800" alt="LLM Chat Bot Screenshots" src="llm chat and gen image ai .png" />

## Features

- **AI chat** — Send messages and receive assistant replies with an animated typing indicator while the response loads.
- **AI image generation** — Type a text prompt and receive a generated image from a multimodal LLM model.
- **Bottom navigation** — Seamlessly switch between the Chat and Image Generation tabs without losing state.
- **Shared input widget** — A single `ChatInputField` component powers both features, parameterized with a hint text and send icon.
- **Empty states** — Placeholder screens guide users before their first interaction on each tab.
- **Splash screen** — Branded intro before landing on the main navigation shell.
- **Error banner** — Inline error feedback when an API call fails.
- **Centralized constants** — All API keys, base URLs, and model names live in `AppStrings`.

---

## Architecture

The project follows a **feature-based presentation layer** with two independent `ChangeNotifier` providers, one per feature.

```
App
├── core/
│   └── constants/              # AppColors, AppStrings (API keys, URLs, model IDs)
├── data/
│   ├── model/                  # MessageModel (chat history serialization)
│   └── service/                # ChatApiService, ImageGenApiService
├── domain/
│   └── entities/               # MessageEntity, ImageMessage
└── presentation/
    ├── provider/               # ChatProvider, ImageGenProvider
    └── screen/
        ├── splash_screen.dart
        ├── main_screen.dart    # Bottom navigation shell
        ├── chat_screen.dart
        ├── image_gen_screen.dart
        └── widget/             # MessageBubble, ImageMessageBubble, ChatInputField,
                                # TypingIndicator, EmptyChat, EmptyImageGen, ErrorBanner
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| Separate `ChatProvider` and `ImageGenProvider` | Keeps chat history and image list fully independent; prevents re-renders across tabs |
| `ChatApiService` sends full message history | Maintains multi-turn conversation context for the LLM |
| `ImageGenApiService` uses `modalities: ['image', 'text']` | Requests both a generated image URL and an optional caption from the multimodal model |
| Shared `ChatInputField` parameterized by `hintText` and `sendIcon` | Avoids duplicating input UI between the two features |

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | >= 3.x | Cross-platform UI framework |
| Dart | ^3.10.8 | Primary programming language |
| `provider` | ^6.1.5+1 | State management |
| `http` | ^1.2.0 | HTTP client for LLM API calls |
| Material 3 | Built-in | Design system and theming |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.8`
- Dart SDK `^3.10.8`
- Android Studio or VS Code with the Flutter extension
- A connected device or emulator (Android or iOS)
- An API key for an OpenAI-compatible chat endpoint and a multimodal image generation endpoint

> **Note:** Add your API keys and base URLs to `lib/core/constants/app_strings.dart` before running.

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/llm_based_ai_chat_bot.git
   cd llm_based_ai_chat_bot
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
llm_based_ai_chat_bot/
├── lib/
│   ├── main.dart                              # App entry point with MultiProvider setup
│   ├── core/
│   │   └── constants/
│   │       ├── app_colors.dart                # Centralized color palette
│   │       └── app_strings.dart               # API keys, URLs, model names, UI strings
│   ├── data/
│   │   ├── model/
│   │   │   └── message_model.dart             # Chat message with toApiMap serialization
│   │   └── service/
│   │       ├── chat_api_service.dart          # OpenAI-compatible chat completion call
│   │       └── image_gen_api_service.dart     # Multimodal image generation call
│   ├── domain/
│   │   └── entities/
│   │       ├── message_entity.dart            # Pure chat message entity
│   │       └── image_message.dart             # Generated image entity
│   └── presentation/
│       ├── provider/
│       │   ├── chat_provider.dart             # Chat history + loading state
│       │   └── image_gen_provider.dart        # Generated images list + loading state
│       ├── screen/
│       │   ├── splash_screen.dart
│       │   ├── main_screen.dart               # Bottom navigation shell
│       │   ├── chat_screen.dart
│       │   └── image_gen_screen.dart
│       └── widget/
│           ├── message_bubble.dart
│           ├── image_message_bubble.dart
│           ├── chat_input_field.dart          # Shared input bar for both features
│           ├── typing_indicator.dart
│           ├── empty_chat.dart
│           ├── empty_image_gen.dart
│           └── error_banner.dart
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Launch** — Splash screen appears briefly before navigating to the main screen.
2. **Chat tab** — Type a message and tap send. `ChatProvider` appends the user message, calls `ChatApiService` with the full conversation history, and displays a typing indicator while waiting. The assistant reply is appended on success.
3. **Image tab** — Type a descriptive prompt and tap generate. `ImageGenProvider` calls `ImageGenApiService` and displays the returned image and caption in a bubble.
4. **Switch tabs** — Both providers retain their state independently when switching between tabs.

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
