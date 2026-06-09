import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static Future<bool>  isFirstTimeStart() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isFirstTimeStart")??true;
  }
  static Future<bool> isLoggedIn() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn")??false;
  }
  static Future<void> setFirstTimeStartFalse()async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstTimeStart", false);
  }
}

