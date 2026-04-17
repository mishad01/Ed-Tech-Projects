import 'package:flutter/material.dart';
import 'package:local_event_finder/core/app_colors.dart';
import 'package:local_event_finder/domain/entities/event.dart';
import 'package:local_event_finder/presentation/core/utils/category_color.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:local_event_finder/presentation/widget/event_map_widget.dart';
import 'package:local_event_finder/presentation/widget/info_card.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  event.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: getCategoryColor(event.category),
                ),
                child: Text(
                  event.category,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InfoCard(
                    icon: Icons.calendar_today,
                    title: 'Date & Time',
                    content: event.date,
                  ),
                  InfoCard(
                    icon: Icons.location_on,
                    title: 'Location',
                    content: event.location,
                  ),
                  Text(
                    'About this event',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(event.description, style: const TextStyle(fontSize: 16)),
                  Text(
                    ' Event Location',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  EventMapWidget(
                    latitude: event.latitude,
                    longitude: event.longitude,
                    location: event.location,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
