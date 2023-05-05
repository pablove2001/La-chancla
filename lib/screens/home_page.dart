import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lachancla/screens/events_page.dart';
import 'package:lachancla/screens/log_in_page.dart';
import 'package:lachancla/screens/sign_up_page.dart';
import 'package:lachancla/services/authFunctions.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AuthServices.isAlreadyAuthenticated()){
        Navigator.push(context,MaterialPageRoute(builder: (context) => EventsPage()),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "La Chancla",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 53,
                          color: Color.fromRGBO(100, 181, 246, 1)),
                    ),
                    Text("¿A donde apunta hoy?",
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 19,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            Container(
              child: Image.asset(
                "assets/images/ruleta.png",
                width: 200,
                height: 200,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SingUpPage()),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      print(
                          '${FirebaseAuth.instance.currentUser?.displayName ?? 'Sin Nombre'}');
                      AuthServices.signinUser(
                          'vergarapablo2001@gmail.com', '123456', context);
                    },
                    child: Text(
                      'print',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
