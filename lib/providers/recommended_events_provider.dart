import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';

class RecommendedEventsProvider with ChangeNotifier {
  List<EventsModel> _events = List.generate(
      100,
      (index) => EventsModel(
            title: 'title',
            description: 'description',
            image: 'https://i.waifu.pics/WGTA1vN.png',
            startDate: DateTime(2023, 12, 29, 13),
            endDate: DateTime(2023, 12, 29, 18),
            urlMaps: 'https://goo.gl/maps/8NQFMEJm7nypwHjPA',
            state_name: 'Colima',
            capacity: 100,
            id_organizer: 'asdf1234',
            status: 'active',
            price: 200,
            minimumAge: 18,
            maximumAge: 25,
          ));

  List<EventsModel> get getEvents => _events;
}
