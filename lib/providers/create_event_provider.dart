import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  int selectedIndex = 0;

  List<String> eventCategories = [
    "sports",
    "birthday",
    "BookClub",
    "eating",
    "exhibition",
    "gaming",
    "holiday",
    "meeting",
    "workshop"
  ];
  changeCategory(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
