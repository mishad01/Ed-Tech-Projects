import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/provider.dart/event_provider.dart';
import 'package:local_event_finder/presentation/screens/event/event_screen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEvents();
    });
  }

  void _loadEvents() {
    context.read<EventProvider>().loadEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text('Home Screen'), backgroundColor: Colors.white),
      body: Consumer<EventProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            final events = provider.event;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return EventCard(
                  event: event,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(eventId: event.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
