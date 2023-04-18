import 'package:flutter/material.dart';

class ProfileContentProvider with ChangeNotifier {
  void setCurrentPageIndex(int index) {
    notifyListeners();
  }
}
