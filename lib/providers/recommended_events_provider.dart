import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';

class RecommendedEventsProvider with ChangeNotifier {
  List<EventsModel> _events = List.generate(
      100,
      (index) => EventsModel(
            title: 'title',
            description: 'description',
            images: [
              'https://i.waifu.pics/WGTA1vN.png',
              'https://wallpapercave.com/wp/wp7490649.jpg',
            ],
            startDate: DateTime(2023, 12, 29, 13),
            endDate: DateTime(2023, 12, 29, 18),
            place: 'ITESO',
            capacity: 100,
            capacityNotAvailable: 20,
            id_organizer: 'asdf1234',
            status: 'active',
            price: 200,
            minimumAge: 18,
            maximumAge: 25,
            recommendations: 'Llevar sueter porque hace calor',
            language: 'Spanish and english',
          ));

  List<EventsModel> get getEvents => _events;
}
