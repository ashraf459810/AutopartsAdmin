import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsHelper {
  Future<SharedPreferences> getPrefs();

  Future<void> savetoken(String token);
  Future<String> gettoken();
}
