import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefetences {
  static const theme_status = 'theme_status';
  setTheme(bool valu) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(theme_status, valu);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
          theme_status,
        ) ??
        false;
  }
}
