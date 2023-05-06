import 'package:flutter/widgets.dart';

class StatesBuilderProvider with ChangeNotifier {
  String? selectedState = 'Jalisco';

  void setState(String? state) {
    selectedState = state;
    print(selectedState);
    notifyListeners();
  }

  String? getState() {
    return selectedState;
  }
}
