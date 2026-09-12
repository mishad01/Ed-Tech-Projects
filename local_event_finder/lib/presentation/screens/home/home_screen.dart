import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:local_event_finder/presentation/screens/event/event_details.dart';
import 'package:local_event_finder/presentation/screens/home/widget/event_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventProvider>().loadEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Event Finder')),
      body: Consumer<EventProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          } else if (provider.events.isEmpty) {
            return const Center(child: Text('No events found.'));
          }
          return ListView.builder(
            itemCount: provider.events.length,
            itemBuilder: (context, index) {
              final event = provider.events[index];
              return EventCard(
                event: event,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventDetails(eventId: event.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
