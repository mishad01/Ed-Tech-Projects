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
  static const String errorNoImage =
      'Could not generate an image. Please try a different prompt.';
  static const String errorRateLimited =
      'The free model is busy right now. Please try again in a moment.';
  static const String errorNoCredits =
      'Image generation needs OpenRouter credits. Add credits to your account and try again.';

  // Chat API
  static const String apiKey =
      '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';
  static const String baseUrl = 'https://openrouter.ai/api/v1';
  static const String model = 'google/gemma-4-26b-a4b-it:free';

  // Image API — image-capable model on the same OpenRouter endpoint.
  // OpenRouter has no free image models; this one needs account credits.
  // NOTE: OpenRouter's dedicated /api/v1/images endpoint is simpler, but it
  // rejects free-tier grant credit outright ("never purchased credits") and
  // has no max_tokens knob, so /chat/completions is the only route that works
  // without a paid balance.
  static const String imageModel = 'google/gemini-3.1-flash-lite-image';
  static const String systemPrompt =
      'You are a helpful and friendly AI assistant.';
}
