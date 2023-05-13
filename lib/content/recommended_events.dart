import 'package:flutter/material.dart';
import 'package:lachancla/screens/starting_page.dart';
import 'package:provider/provider.dart';
import 'package:lachancla/providers/recommended_events_provider.dart';
import '../widgets/easter_egg.dart';
import '../widgets/recommended_cards.dart';

class RecommendedEvents extends StatelessWidget {
  const RecommendedEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Eventos para ti!",
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 36,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<RecommendedEventsProvider>()
                                  .initProvider();
                            },
                            icon: Icon(Icons.replay),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StartingPage()),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EasterEgg();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Consumer<RecommendedEventsProvider>(
              builder: (context, provider, child) {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: provider.getEvents.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    provider.initProvider();
                    return RecommendedCards(
                      event: provider.getEvents[index],
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
