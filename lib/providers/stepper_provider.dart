import 'package:flutter/material.dart';

class StepperProvider with ChangeNotifier {
  List<String> _gustos = [];

  List<String> get getGustos => _gustos;

  void setGustos(List<String> gustos) {
    _gustos = gustos;
    notifyListeners();
  }
}
