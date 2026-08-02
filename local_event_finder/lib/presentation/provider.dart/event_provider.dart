import 'package:flutter/material.dart';
import 'package:local_event_finder/data/service/event_service.dart';
import 'package:local_event_finder/domain/event.dart';

class EventProvider extends ChangeNotifier {
  EventProvider(this._eventService);

  final EventService _eventService;

  List<Event> _event = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Event> get event => _event;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadEvent() async {
    _isLoading = true;
    notifyListeners();

    try {
      _event = await _eventService.getAllEvents();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to load events: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Event getEventById(String id) {
    return _event.firstWhere((event) => event.id == id);
  }

  Future<void> refreshEvent() async {
    await loadEvent();
  }
}
