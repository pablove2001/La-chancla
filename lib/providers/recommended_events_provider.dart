import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';
import 'package:lachancla/services/firebase_service.dart';

class RecommendedEventsProvider with ChangeNotifier {
  List<EventsModel> _events = List.generate(
      10,
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

  void initProvider() async {
    List eventsFirebase = await getEventsFirebase();
    List<EventsModel> events = [];

    for (var event in eventsFirebase) {
      events.add(
        EventsModel(
          title: event['title'],
          description: event['description'],
          image: event['image'],
          startDate: event['startDate'].toDate(),
          endDate: event['endDate'].toDate(),
          state_name: event['state_name'],
          urlMaps: event['urlMaps'],
          capacity: event['capacity'],
          id_organizer: event['id_organizer'],
          status: 'Sin estatus',
        ),
      );
    }
    this._events = events;
    notifyListeners();
  }
}
