import 'package:flutter/material.dart';
import 'package:local_event_finder/domain/entities/event.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.eventId});

  final String eventId;
  @override
  Widget build(BuildContext context) {
    final eventProvider = context.watch<EventProvider>();
    final Event event = eventProvider.getEventById(eventId);

    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              event.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(event.description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
