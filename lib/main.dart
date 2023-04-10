import 'package:flutter/material.dart';
import 'package:lachancla/providers/events_page_provider.dart';
import 'package:lachancla/providers/recommended_events_provider.dart';
import 'package:lachancla/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecommendedEventsProvider()),
        ChangeNotifierProvider(create: (_) => EventsPageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
