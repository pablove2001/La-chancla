import 'package:flutter/material.dart';
import 'package:lachancla/screens/event_details_page.dart';

class RecommendedCards extends StatelessWidget {
  const RecommendedCards({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
