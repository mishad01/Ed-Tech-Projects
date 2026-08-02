import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapWidget extends StatefulWidget {
  const EventMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.location,
  });
  final double latitude;
  final double longitude;
  final String location;

  @override
  State<EventMapWidget> createState() => _EventMapWidgetState();
}

class _EventMapWidgetState extends State<EventMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: MarkerId('event_location'),
              position: LatLng(widget.latitude, widget.longitude),
            ),
          },
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
