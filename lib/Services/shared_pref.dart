import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{

  static String userNameKey = "USERNAMEKAY";
  static String userEmailKey = "USEREMAILKEY";
  static String userLoggedInKey = "USERLOGGEDINKEY";

  // Save Data

  Future<bool>saveIsLoggedIn (bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(userLoggedInKey, isLoggedIn);
  }

  Future<bool>saveUserName (String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool>saveEmail (String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  // Get Data

  Future<bool>getIsLoggedIn () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey);
  }

  Future<String>getUserName () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String>getEmail () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }
}