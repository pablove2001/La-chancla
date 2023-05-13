import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';
import 'package:lachancla/services/firebase_service.dart';

class AllEventsProvider with ChangeNotifier {
  List<EventsModel> _events = [];

  List<EventsModel> get getEvents => _events;

  Future<void> initProvider() async {
    List eventsFirebase = await getAllEventsFirebase();
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
