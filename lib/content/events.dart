import 'package:flutter/material.dart';
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: TextField(
                    cursorColor: Colors.grey.shade500,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 16.5),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
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
