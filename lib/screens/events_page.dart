import 'package:flutter/material.dart';
import 'package:lachancla/providers/events_page_provider.dart';
import 'package:lachancla/screens/add_events_page.dart';
import 'package:provider/provider.dart';
import '../content/events.dart';
import '../content/profile.dart';
import '../content/recommended_events.dart';

class EventsPage extends StatelessWidget {
  final _pagesName = ["Home", "Events", "Profile"];
  final _pagesList = [RecommendedEvents(), Events(), Profile()];
  EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      body: IndexedStack(
        index: context.read<EventsPageProvider>().getCurrentPageIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: context.watch<EventsPageProvider>().getCurrentPageIndex,
        onDestinationSelected: (value) {
          context.read<EventsPageProvider>().setCurrentPageIndex(value);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '${_pagesName[0]}',
          ),
          NavigationDestination(
            icon: Icon(Icons.event),
            label: '${_pagesName[1]}',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: '${_pagesName[2]}',
          ),
          MaterialButton(
            child: Icon(
              Icons.add_box_outlined,
              size: 38,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddEventsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
