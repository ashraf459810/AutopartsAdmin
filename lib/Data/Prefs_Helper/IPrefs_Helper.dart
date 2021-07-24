

import 'package:shared_preferences/shared_preferences.dart';

import 'Prefs_Helper.dart';

class IprefsHelper implements PrefsHelper{

@override
  Future<SharedPreferences> getPrefs() async {
  return await SharedPreferences.getInstance();
}



  



 


}