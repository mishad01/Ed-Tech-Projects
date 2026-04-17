import 'package:local_event_finder/data/models/event_model.dart';
import 'package:local_event_finder/domain/entities/event.dart';

class EventService {
  Future<List<Event>> fetchEvents() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return EventModel.sampleEvents;
  }
}
