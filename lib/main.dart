import 'package:flutter/material.dart';
import 'package:lachancla/providers/add_events_provider.dart';
import 'package:lachancla/providers/event_details_provider.dart';
import 'package:lachancla/providers/events_page_provider.dart';
import 'package:lachancla/providers/recommended_events_provider.dart';
import 'package:lachancla/providers/states_builder_provider.dart';
import 'package:lachancla/providers/stepper_provider.dart';
import 'package:lachancla/screens/home_page.dart';
import 'package:provider/provider.dart';
// firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => RecommendedEventsProvider()),
        ChangeNotifierProvider<RecommendedEventsProvider>.value(
          value: RecommendedEventsProvider()..initProvider(),
        ),
        ChangeNotifierProvider(create: (_) => EventsPageProvider()),
        ChangeNotifierProvider(create: (_) => EventDetailsProvider()),
        ChangeNotifierProvider<AddEventsProvider>(
            create: (context) => AddEventsProvider()),
        ChangeNotifierProvider(create: (_) => StatesBuilderProvider()),
        ChangeNotifierProvider(create: (_) => StepperProvider()),
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
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
