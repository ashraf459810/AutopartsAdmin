import 'package:admin/Core/Consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Prefs_Helper.dart';

class IprefsHelper implements PrefsHelper {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<void> savetoken(String token) async {
    return (await getPrefs()).setString(S.token, token);
  }

  @override
  Future<String> gettoken() async {
    return (await getPrefs()).getString(
      S.token,
    );
  }
}
