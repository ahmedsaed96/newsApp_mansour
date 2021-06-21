import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  static Future storeThemeMode({bool isDark = false}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('Theme', isDark);
  }


}
