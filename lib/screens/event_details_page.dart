import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      appBar: AppBar(
        title: Text("Event details"),
      ),
      body: Center(
        child: Text("Event details page"),
      ),
    );
  }
}
