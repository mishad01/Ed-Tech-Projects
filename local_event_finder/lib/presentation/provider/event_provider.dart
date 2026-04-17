import 'package:flutter/material.dart';
import 'package:local_event_finder/data/service/event_service.dart';
import 'package:local_event_finder/domain/entities/event.dart';

class EventProvider extends ChangeNotifier {
  EventProvider(this._eventService);
  final EventService _eventService;

  List<Event> _events = [];
  List<Event> get events => _events;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  Future<void> loadEvent() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _events = await _eventService.fetchEvents();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to load events. $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Event getEventById(String id) {
    return _events.firstWhere((event) => event.id == id);
  }

  Future<void> refreshEvent() async {
    await loadEvent();
  }
}
