import 'package:flutter/material.dart';
import 'package:lachancla/screens/update_events_page.dart';

class MyEventsCards extends StatelessWidget {
  const MyEventsCards({super.key});

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
            leading: Image.network(
              "https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png",
            ),
            title: Text('Melbourne Cricket Stadium'),
            subtitle: Text('Australia'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                child: Icon(
                  Icons.edit,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdateEventsPage(),
                    ),
                  );
                },
              ),
              MaterialButton(
                child: Icon(
                  Icons.delete,
                ),
                onPressed: () => _dialogBuilder(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Quieres eliminarlo?'),
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
