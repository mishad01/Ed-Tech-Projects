import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/data/model/message_model.dart';
import 'package:llm_chat_app/data/service/chat_api_service.dart';

class ChatProvider extends ChangeNotifier {
  ChatProvider({ChatApiService? chatApiService})
    : _chatApiService = chatApiService ?? ChatApiService();

  final ChatApiService _chatApiService;
  final List<MessageModel> _messages = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MessageModel> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    _messages.add(MessageModel(role: 'user', text: text, time: DateTime.now()));

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final replyText = await _chatApiService.fetchAssistantReply(_messages);

      _messages.add(
        MessageModel(role: 'assistant', text: replyText, time: DateTime.now()),
      );
    } on TimeoutException catch (e) {
      print('[Chat] TimeoutException: $e');
      _errorMessage = AppStrings.errorTimeout;
    } on SocketException catch (e) {
      print('[Chat] SocketException: $e');
      _errorMessage = AppStrings.errorNoInternet;
    } catch (e, stack) {
      print('[Chat] Unexpected error: $e');
      print('[Chat] Stack trace: $stack');
      _errorMessage = AppStrings.errorGeneral;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    _errorMessage = null;
    notifyListeners();
  }
}
