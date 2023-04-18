import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lachancla/providers/recommended_events_provider.dart';
import '../widgets/easter_egg.dart';
import '../widgets/recommended_cards.dart';

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
            Stack(
              children: [
                Column(
                  children: [
                    Text(
                      "Hola Mariana",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 36,
                          color: Colors.black),
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
                Positioned(
                  top: 0,
                  right: 0,
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
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount:
                    context.watch<RecommendedEventsProvider>().getEvents.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return RecommendedCards(
                    event: context
                        .read<RecommendedEventsProvider>()
                        .getEvents[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
