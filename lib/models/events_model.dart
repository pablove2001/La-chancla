class EventsModel {
  final String title;
  final String description;
  final List<String> images;
  // final DateTime date;
  final String date;

  EventsModel({
    this.title = 'Ruka-chan',
    this.description = 'None',
    this.images = const [
      'https://i.ytimg.com/vi/8cHuTyjvqWg/maxresdefault.jpg'
    ],
    this.date = '13-13-1313',
  });
}
