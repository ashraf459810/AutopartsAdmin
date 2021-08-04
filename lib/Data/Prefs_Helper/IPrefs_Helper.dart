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

  @override
  Future<bool> getisverify() async {
    return (await getPrefs()).getBool(
      S.islogin,
    );
  }

  @override
  Future<void> setisverify(bool s) async {
    return (await getPrefs()).setBool(S.islogin, s);
  }
}
