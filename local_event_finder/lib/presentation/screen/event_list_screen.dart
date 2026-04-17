import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/core/utils/category_color.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:local_event_finder/presentation/screen/event_details_screen.dart';
import 'package:provider/provider.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventProvider>().loadEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Event Finder')),
      body: Consumer<EventProvider>(
        builder: (context, provider, child) {
          return RefreshIndicator(
            onRefresh: provider.refreshEvent,
            child: ListView.builder(
              itemCount: provider.events.length,
              itemBuilder: (context, index) {
                final event = provider.events[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailsScreen(eventId: event.id),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.network(
                              event.imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  spacing: 8,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    Text(event.date),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  spacing: 8,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    Text(event.location),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
