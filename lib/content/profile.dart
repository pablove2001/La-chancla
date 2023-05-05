import 'package:firebase_auth/firebase_auth.dart';
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
                    leading: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                        "${FirebaseAuth.instance.currentUser?.photoURL ?? 'https://user-images.githubusercontent.com/52970365/236109946-96fdda24-44fe-4e20-a9a8-458cc57cf026.png'}",
                      ),
                    ),
                    title: Text(
                      "${FirebaseAuth.instance.currentUser?.displayName ?? 'Sin Nombre'}",
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      "21-04-2023",
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
