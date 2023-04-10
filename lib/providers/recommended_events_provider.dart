import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';

class RecommendedEventsProvider with ChangeNotifier {
  List<EventsModel> _events = List.generate(100, (index) => EventsModel());

  List<EventsModel> get getEvents => _events;
}
