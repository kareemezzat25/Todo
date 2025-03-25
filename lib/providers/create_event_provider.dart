import 'package:flutter/material.dart';
import 'package:todo_app/models/eventmodel.dart';

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
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);

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

  void initEdit(EventModel? task) {
    selectedDate = DateTime.fromMillisecondsSinceEpoch(task?.date ?? 0);
    List<String> timeParts = task?.time.split(":") ?? ["0", "0"];
    int hour = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    selectedTime = TimeOfDay(hour: hour, minute: minutes);

    int index = eventCategories.indexOf(task?.category ?? "");
    if (index != -1) {
      selectedIndex = index;
    }
  }
}
