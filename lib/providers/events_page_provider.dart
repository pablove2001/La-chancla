import 'package:flutter/material.dart';

class EventsPageProvider with ChangeNotifier {
  int _currentPageIndex = 0;

  int get getCurrentPageIndex => _currentPageIndex;

  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
