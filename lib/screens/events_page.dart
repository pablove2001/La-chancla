import 'package:flutter/material.dart';
import 'package:lachancla/screens/add_events_page.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Hola Mariana",
                  style: TextStyle(
                      fontFamily: 'Lobster', fontSize: 36, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Encontré estos eventos que podrían interesarte!",
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 8,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 168, 85, 1),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Image.network(
                            "https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png",
                            width: 50,
                            height: 100,
                          ),
                          subtitle:
                              Center(child: Text("The greatest Shownman")),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventsPage()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
