import 'package:flutter/material.dart';
import 'package:lachancla/screens/event_details_page.dart';

class RecommendedEvents extends StatelessWidget {
  const RecommendedEvents({super.key});

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
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.black,
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
                              "https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png",
                              height: 100,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                "The greatest Shownman",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                "The greatest Shownman",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        /*  */
      ),
    );
  }
}
