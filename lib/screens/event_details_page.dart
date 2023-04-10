import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';

class EventDetailsPage extends StatelessWidget {
  final EventsModel event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      appBar: AppBar(
        title: Text("${event.title}"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "${event.images[0]}",
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text("${event.description}"),
          ],
        ),
      ),
    );
  }
}
