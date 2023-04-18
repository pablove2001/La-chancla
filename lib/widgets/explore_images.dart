import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
            ),
            child: Image.network(
              "https://i.waifu.pics/WGTA1vN.png",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
