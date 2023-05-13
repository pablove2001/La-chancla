import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_events_provider.dart';
import '../widgets/explore_images.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Encuentra eventos!",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 36,
                          color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<AllEventsProvider>().initProvider();
                    },
                    icon: Icon(Icons.replay),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ExploreImages(),
            ),
          ],
        ),
      ),
    );
  }
}
