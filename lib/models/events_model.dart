class EventsModel {
  // Required
  final String title;
  final String description;
  final String image;
  final DateTime startDate;
  final DateTime endDate;
  final String urlMaps;
  final String state_name;
  final int capacity;
  final String id_organizer; // Event owner
  final String status; // deleted | active | paused

  // Default
  final double price;
  final int minimumAge;
  final int maximumAge;

  EventsModel({
    // Required
    required this.title,
    required this.description,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.state_name,
    required this.urlMaps,
    required this.capacity,
    required this.id_organizer,
    required this.status,

    // Default
    this.price = 0.0,
    this.minimumAge = 0,
    this.maximumAge = 120,
  });
}
