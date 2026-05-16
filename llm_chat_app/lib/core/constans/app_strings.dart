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
  //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
  static const String baseUrl = 'https://openrouter.ai/api/v1';
  static const String model = 'google/gemini-3.1-flash-lite';
  static const String systemPrompt =
      'You are a helpful and friendly AI assistant.';
}
