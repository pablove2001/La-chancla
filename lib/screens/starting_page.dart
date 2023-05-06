import 'package:flutter/material.dart';
import 'package:lachancla/widgets/stepper.dart';

class StartingPage extends StatelessWidget {
  StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      body: UserStepper(),
    );
  }
}