import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;
  static const String KEY_SELECTED_THEME = 'key_selected_theme';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }
}
