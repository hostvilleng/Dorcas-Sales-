import 'package:dorcashub/pages/authPages/parentAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreference{
  static SharedPreferences _preferences;

  static const _keyPartner = 'partner';
  static Future init() async =>

  _preferences =await SharedPreferences.getInstance();
  static Future setPartner(String partner)async =>
      await _preferences.setString(_keyPartner,  partner);

  static String getPartner() => _preferences.getString(_keyPartner);
}