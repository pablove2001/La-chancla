import 'package:flutter/material.dart';
import 'package:lachancla/providers/add_events_provider.dart';
import 'package:lachancla/providers/event_details_provider.dart';
import 'package:lachancla/providers/events_page_provider.dart';
import 'package:lachancla/providers/recommended_events_provider.dart';
import 'package:lachancla/providers/states_builder_provider.dart';
import 'package:lachancla/providers/stepper_provider.dart';
import 'package:lachancla/providers/user_events_provider.dart';
import 'package:lachancla/providers/user_favorites_provider.dart';
import 'package:lachancla/screens/events_page.dart';
import 'package:lachancla/screens/home_page.dart';
import 'package:lachancla/services/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';
// firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//bloc
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthEvent()),
        ),
        // ChangeNotifierProvider(create: (_) => RecommendedEventsProvider()),
        ChangeNotifierProvider<RecommendedEventsProvider>.value(
          value: RecommendedEventsProvider()..initProvider(),
        ),
        ChangeNotifierProvider(create: (_) => EventsPageProvider()),
        ChangeNotifierProvider(create: (_) => EventDetailsProvider()),
        ChangeNotifierProvider<AddEventsProvider>(
            create: (context) => AddEventsProvider()),
        ChangeNotifierProvider(create: (_) => StatesBuilderProvider()),
        ChangeNotifierProvider(
          create: (_) => StepperProvider(),
        ),
        ChangeNotifierProvider<UserEventsProvider>.value(
          value: UserEventsProvider()..initProvider(),
        ),
        ChangeNotifierProvider<UserFavEventsProvider>.value(
          value: UserFavEventsProvider()..initProvider(),
        ),
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
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Favor de autenticarse. ${state.eMsg}"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return EventsPage();
          } else if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState) {
            return HomePage();
          }
          return Center(
            child: CircularProgressIndicator(),
          ); // TODO: replace with Splash screen page (opcional)
        },
      ),
    );
  }
}
