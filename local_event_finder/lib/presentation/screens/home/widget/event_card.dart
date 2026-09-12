import 'package:flutter/material.dart';
import 'package:local_event_finder/core/category_color.dart';
import 'package:local_event_finder/domain/entities/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, required this.onTap});
  final Event event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: .antiAlias,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Hero(
              tag: 'event-image-${event.id}',
              child: Image.network(
                event.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: Colors.grey),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
