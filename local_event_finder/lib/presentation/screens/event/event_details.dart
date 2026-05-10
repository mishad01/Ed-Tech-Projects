import 'package:flutter/material.dart';
import 'package:local_event_finder/core/category_color.dart';
import 'package:local_event_finder/domain/entities/event.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:local_event_finder/presentation/screens/event/widget/event_map_widget.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, this.eventId});
  final String? eventId;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = context.watch<EventProvider>();
    final Event event = eventProvider.getEventById(widget.eventId!);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Event Details', style: TextStyle(fontWeight: .bold)),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Hero(
                tag: 'event-image-${widget.eventId}',
                child: Image.network(
                  event.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                padding: .symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: getCategoryColor(event.category),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  event.category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      event.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(event.date, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Wrap(
                      children: [
                        Icon(Icons.location_city, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          event.location,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(
                      'About this event',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      event.description,
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),

                    Text(
                      'Event Location',
                      style: TextStyle(
                        fontSize: 17,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
