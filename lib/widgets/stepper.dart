import 'package:flutter/material.dart';
import 'package:lachancla/screens/events_page.dart';
import 'package:lachancla/widgets/interest_selector.dart';
import 'package:lachancla/widgets/states_builder.dart';

class UserStepper extends StatefulWidget {
  const UserStepper({super.key});

  @override
  State<UserStepper> createState() => _UserStepperState();
}

class _UserStepperState extends State<UserStepper> {
  int currentStep = 0;
  continueStep() {
    if (currentStep < 1) {
      setState(() {
        currentStep += 1;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventsPage()),
      );
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep -= 1;
      });
    } else {
      Navigator.pop(context);
    }
  }

  onStepTapped(int step) {
    setState(() {
      currentStep = step;
    });
  }

  Widget controlsBuilder(context, details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: details.onStepContinue,
          child: Text("Continuar"),
        ),
        SizedBox(width: 10),
        OutlinedButton(
          onPressed: details.onStepCancel,
          child: Text("Cancelar"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepContinue: continueStep,
              onStepCancel: cancelStep,
              onStepTapped: onStepTapped,
              controlsBuilder: controlsBuilder,
              steps: [
                Step(
                    title: Text("Step 1"),
                    content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InterestSelector(),
                        ]),
                    isActive: currentStep >= 0,
                    state: currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled),
                Step(
                    title: Text("Step 2"),
                    content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StatesBuilder(),
                        ]),
                    isActive: currentStep >= 1,
                    state: currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
