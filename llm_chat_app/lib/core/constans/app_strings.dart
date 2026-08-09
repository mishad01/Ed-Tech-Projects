class AppStrings {
  static const String appName = 'AI Chat Bot';
  static const String inputHint = 'Type a message...';
  static const String imageGenInputHint = 'Describe an image...';
  static const String emptyChat =
      'Start a conversation!\nSend a message below.';

  static const String errorNoInternet =
      'No internet connection. Please check and try again.';
  static const String errorTimeout = 'Request timed out. Please try again.';
  static const String errorGeneral = 'Something went wrong. Please try again.';

  // Chat API
  static const String apiKey =
      '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';
  static const String baseUrl = 'https://openrouter.ai/api/v1';
  static const String model = 'google/gemma-4-26b-a4b-it:free';
  static const String systemPrompt =
      'You are a helpful and friendly AI assistant.';
}
