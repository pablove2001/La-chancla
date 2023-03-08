import 'package:flutter/material.dart';
import 'package:lachancla/starting_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      /*appBar: AppBar(
        title: Text('Material App Bar'),
      ),*/
      body: Column(children: [
        Expanded(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "La Chancla",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 41,
                        color: Colors.blue[300]),
                  ),
                  Text("¿A donde apunta hoy?",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Image.asset(
              "assets/images/ruleta.png",
              width: 200,
              height: 100,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 170, bottom: 70),
            child: MaterialButton(
              color: Colors.blue[100],
              child: Text("Comenzar"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StartingPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
