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

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 0, minute: 0);

  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  changeTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  changeCategory(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
