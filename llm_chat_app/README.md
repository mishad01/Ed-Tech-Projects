# LLM Chat App

An AI-powered Flutter application that combines a real-time chat interface with an AI image generation tab, both backed by LLM API calls. Built to demonstrate multi-provider state management, concurrent API integration, and feature-based architecture in Flutter.

<img width="800" alt="LLM Chat App Screenshots" src="llm chat and gen image ai .png" />

## Features

- **AI chat** — Send messages and receive assistant replies with an animated typing indicator while the response loads.
- **AI image generation** — Type a text prompt and receive a generated image from a multimodal LLM model.
- **Bottom navigation** — Seamlessly switch between the Chat and Image Generation tabs without losing state.
- **Shared input widget** — A single `ChatInputField` component powers both features, parameterized with a hint text and send icon.
- **Empty states** — Illustrated placeholder screens guide users before their first interaction on each tab.
- **Splash screen** — Branded intro screen before landing on the main navigation shell.
- **Centralized constants** — All API keys, base URLs, model names, and UI strings live in `AppStrings`.

---

## Architecture

The project follows a **feature-based presentation layer** with two independent `ChangeNotifier` providers, one per feature. A shared `core` layer holds constants and colors.

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
                                # TypingIndicator, EmptyChat, EmptyImageGen
```

**Key architectural decisions:**

| Decision | Rationale |
|---|---|
| Separate `ChatProvider` and `ImageGenProvider` | Keeps chat history and image list fully independent; prevents re-renders across tabs |
| `ChatApiService` sends full message history | Maintains multi-turn conversation context for the LLM |
| `ImageGenApiService` uses `modalities: ['image', 'text']` | Requests both a text caption and an image URL from the multimodal model |
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
   git clone https://github.com/<your-username>/llm_chat_app.git
   cd llm_chat_app
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
llm_chat_app/
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
│       └── screen/
│           ├── splash_screen.dart
│           ├── main_screen.dart               # Bottom navigation shell
│           ├── chat_screen.dart
│           ├── image_gen_screen.dart
│           └── widget/
│               ├── message_bubble.dart
│               ├── image_message_bubble.dart
│               ├── chat_input_field.dart      # Shared input bar for both features
│               ├── typing_indecator.dart
│               ├── empty_chat.dart
│               └── empty_image_gen.dart
├── android/
├── ios/
├── test/
├── pubspec.yaml
└── README.md
```

---

## Usage / How It Works

1. **Launch** — The splash screen appears briefly before navigating to the main screen.
2. **Chat tab** — Type a message and tap send. `ChatProvider` appends the user message, calls `ChatApiService` with the full conversation history, and displays a typing indicator while waiting. The assistant reply is appended on success.
3. **Image tab** — Type a descriptive prompt and tap the generate button. `ImageGenProvider` calls `ImageGenApiService` with the prompt and the `image` modality. The returned image URL and optional caption are displayed in a bubble.
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

This project is created for educational purposes as part of **Ostad Batch 13**.
