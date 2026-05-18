import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/data/service/image_gen_api_service.dart';
import 'package:llm_chat_app/domain/entities/image_message.dart';

class ImageGenProvider extends ChangeNotifier {
  ImageGenProvider({ImageGenApiService? imageGenApiService})
    : _imageGenApiService = imageGenApiService ?? ImageGenApiService();

  final ImageGenApiService _imageGenApiService;
  final List<ImageMessage> _messages = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ImageMessage> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> generateImage(String prompt) async {
    if (prompt.trim().isEmpty) return;

    _messages.add(
      ImageMessage(role: 'user', prompt: prompt, time: DateTime.now()),
    );

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final imageMessage = await _imageGenApiService.generateImage(prompt);
      _messages.add(imageMessage);
    } on TimeoutException catch (e) {
      print('[ImageGen] TimeoutException: $e');
      _errorMessage = AppStrings.errorTimeout;
    } on SocketException catch (e) {
      print('[ImageGen] SocketException: $e');
      _errorMessage = AppStrings.errorNoInternet;
    } catch (e, stack) {
      print('[ImageGen] Unexpected error: $e');
      print('[ImageGen] Stack trace: $stack');
      _errorMessage = AppStrings.errorGeneral;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearImages() {
    _messages.clear();
    _errorMessage = null;
    notifyListeners();
  }
}
