import 'package:flutter/material.dart';
import 'package:lachancla/models/events_model.dart';

class FavoritesCards extends StatelessWidget {
  final EventsModel event;
  const FavoritesCards({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            "${event.image}",
            //"https://i.stack.imgur.com/Of2w5.jpg",
            width: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
        title: Text(event.title),
        subtitle: Text(event.state_name),
        trailing: MaterialButton(
          child: Icon(
            Icons.favorite,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
