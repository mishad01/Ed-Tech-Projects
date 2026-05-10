import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Event Finder', style: TextStyle(fontWeight: .bold)),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Consumer<EventProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.hasError) {
            return Center(
              child: Text(
                provider.errorMessage ?? 'Unknown error',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.events.length,
            itemBuilder: (context, index) {
              final event = provider.events[index];
              return ListTile(
                leading: Image.network(
                  event.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(event.title),
                subtitle: Text('${event.date} at ${event.time}'),
              );
            },
          );
        },
      ),
    );
  }
}
