import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      body: SafeArea(
        child: Center(
          child: Text("Events"),
        ),
      ),
    );
  }
}
