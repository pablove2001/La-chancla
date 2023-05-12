import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';
import 'package:lachancla/services/firebase_service.dart';

class UserEventsProvider with ChangeNotifier {
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
    ),
  );
  List<EventsModel> get getEvents => _events;

  void initProvider() async {
    //get uid of current user
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final String? uid = user?.uid;

    List eventsFirebase = await getUserEventsFirebase(uid!);
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
