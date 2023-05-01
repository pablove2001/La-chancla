import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lachancla/providers/recommended_events_provider.dart';
import 'package:provider/provider.dart';
import '../screens/event_details_page.dart';

class ExploreImages extends StatelessWidget {
  const ExploreImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
          ],
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventDetailsPage(
                    event: context
                        .read<RecommendedEventsProvider>()
                        .getEvents[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              child: Image.network(
                context
                    .read<RecommendedEventsProvider>()
                    .getEvents[index]
                    .image,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
