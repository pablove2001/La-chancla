import 'package:flutter/material.dart';
import 'package:lachancla/providers/user_events_provider.dart';
import 'package:lachancla/screens/event_details_page.dart';
import 'package:lachancla/screens/update_events_page.dart';
import 'package:provider/provider.dart';
import '../models/events_model.dart';

class MyEventsCards extends StatelessWidget {
  final EventsModel event;
  const MyEventsCards({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                "${event.image}",
                //"https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png",
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text(event.title),
            subtitle: Text(event.state_name),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(event: this.event),
                        ),
                      );
                    },
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: Icon(
                      Icons.delete,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                      _dialogBuilder(context, this.event);
                    },
                  ),
                  value: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context, EventsModel event) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure you want to delete this event?'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              context.read<UserEventsProvider>().borrarEvento(event);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
