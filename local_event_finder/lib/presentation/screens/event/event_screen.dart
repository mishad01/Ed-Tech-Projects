import 'package:flutter/material.dart';
import 'package:local_event_finder/core/category_color.dart';
import 'package:local_event_finder/domain/event.dart';
import 'package:local_event_finder/presentation/provider.dart/event_provider.dart';
import 'package:local_event_finder/presentation/screens/event/widget/event_map_widget.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, this.eventId});
  final String? eventId;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = context.read<EventProvider>();
    final Event event = eventProvider.getEventById(widget.eventId!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Event Screen'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              event.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: getCategoryColor(event.category),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                event.category,
                style: TextStyle(color: Colors.white),
              ), // Invisible text to maintain height
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(event.date),
                  Text(event.location),
                  Text(
                    'About this event',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(event.description),
                  Text(
                    'Event Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  EventMapWidget(
                    latitude: event.latitude,
                    longitude: event.longitude,
                    location: event.location,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
