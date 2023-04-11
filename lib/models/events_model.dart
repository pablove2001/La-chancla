class EventsModel {
  // Required
  final String title;
  final String description;
  final List<String> images;
  final DateTime startDate;
  final DateTime endDate;
  final String eventPlace;
  final int capacity;
  final int capacityNotAvailable;
  final String id_organizer; // Event owner
  final String status; // deleted | active | paused

  // Default
  final double price;
  final int minimumAge;
  final int maximumAge;
  final String recommendations;
  final String language;

  // Not required
  final DateTime creationDate = DateTime.now();

  EventsModel({
    // Required
    required this.title,
    required this.description,
    required this.images,
    required this.startDate,
    required this.endDate,
    required this.eventPlace,
    required this.capacity,
    required this.capacityNotAvailable,
    required this.id_organizer,
    required this.status,

    // Default
    this.price = 0.0,
    this.minimumAge = 0,
    this.maximumAge = 120,
    this.recommendations = 'No recommendations',
    this.language = 'Spanish',
  });
}
