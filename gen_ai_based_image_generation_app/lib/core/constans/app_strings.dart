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
  static const String apiKey = 'sk-LvqSBOf80jxFCYNvf6vPpQ';
  static const String baseUrl = 'https://api.durjoyai.com';
  static const String model = 'durjoy-kotha-1';
  static const String systemPrompt =
      'You are a helpful and friendly AI assistant.';

  // Image Generation API
  static const String imageGenApiKey =
      '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';
  static const String imageGenBaseUrl = 'https://openrouter.ai/api/v1';
  static const String imageGenModel = 'google/gemini-2.5-flash-image';
}
