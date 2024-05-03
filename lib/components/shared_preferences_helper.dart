import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool getDarkTheme() {
    return _prefs.getBool('darkTheme') ?? false;
  }

  static Future<void> setDarkTheme(bool value) async {
    await _prefs.setBool('darkTheme', value);
  }

  static int getRemainingTime() {
    return _prefs.getInt('remainingTime') ?? 0;
  }

  static Future<void> setRemainingTime(int value) async {
    await _prefs.setInt('remainingTime', value);
  }

  static List<String> getSavedAlarms() {
    return _prefs.getStringList('savedAlarms') ?? [];
  }

  static Future<void> setSavedAlarms(List<String> alarms) async {
    await _prefs.setStringList('savedAlarms', alarms);
  }
}


// // Ler valores
// bool darkTheme = SharedPreferencesHelper.getDarkTheme();
// int remainingTime = SharedPreferencesHelper.getRemainingTime();
// List<String> savedAlarms = SharedPreferencesHelper.getSavedAlarms();
//
// // Gravar valores
// await SharedPreferencesHelper.setDarkTheme(true);
// await SharedPreferencesHelper.setRemainingTime(60);
// await SharedPreferencesHelper.setSavedAlarms(['alarm1', 'alarm2']);