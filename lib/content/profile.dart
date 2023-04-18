import 'package:flutter/material.dart';
import '../widgets/favorites_cards.dart';

import '../widgets/my_events_cards.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ListTile(
                    leading: Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.8DDnZg9-q5BkyTcfOAYsbwHaGA%26pid%3DApi&f=1&ipt=7467acdf6413d32d971e931d16ff58ba57ef92753e5476e53d6842ea03b599e4&ipo=images",
                    ),
                    title: Text(
                      "name",
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      "tipo de cuenta",
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "My events",
                    ),
                    Tab(
                      text: "Favorites",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(10),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return MyEventsCards();
                    },
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(10),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return FavoritesCards();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
