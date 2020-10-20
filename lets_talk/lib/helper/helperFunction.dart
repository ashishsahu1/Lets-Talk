import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class helperFunction {
  static String sharedPrefferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPrefferenceUserNameKey = "USERNAMEKEY";
  static String sharedPrefferenceUserEmailKey = "USEREMAILKEY";

  // saving data to sharedpreference

  static Future<bool> saveuserLoggedInSharedPrefference(
      bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(
        sharedPrefferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameInSharedPrefference(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPrefferenceUserNameKey, username);
  }

  static Future<bool> saveuserEmailIdSharedPrefference(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPrefferenceUserEmailKey, email);
  }

  //getting the data from shared prefference

  static Future<bool> getuserLoggedInSharedPrefference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPrefferenceUserLoggedInKey);
  }

  static Future<String> getUserNameInSharedPrefference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(sharedPrefferenceUserNameKey);
  }

  static Future<String> getuserEmailIdSharedPrefference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(sharedPrefferenceUserEmailKey);
  }
}
