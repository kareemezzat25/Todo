import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveEligibilty() {
    prefs.setBool("OnBoarding", true);
  }

  static bool? getEligibilty() {
    return prefs.getBool("OnBoarding");
  }
}
