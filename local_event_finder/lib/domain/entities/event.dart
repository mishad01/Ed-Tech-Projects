class Event {
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.category,
  });

  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String category;
}
