import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';
import 'package:lachancla/screens/event_details_page.dart';

class RecommendedCards extends StatelessWidget {
  final EventsModel event;
  const RecommendedCards({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventDetailsPage(
              event: event,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Image.network(
                "${event.images[0]}",
                height: 100,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "${event.title}",
                ),
              ),
              subtitle: Center(
                child: Text(
                  "${event.date}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
