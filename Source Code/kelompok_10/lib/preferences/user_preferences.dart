import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  final saveToken = "token";

  Future<String> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final userDataToken = prefs.getString(saveToken);
    print("User Prefernces: getUser ->$userDataToken");

    //Check if userDataToken is null
    if (userDataToken == null) {
      return "";
    } else {
      return userDataToken;
    }
  }

  setUser(String token) async {
    final prefs = await SharedPreferences.getInstance();

    // final setToken = jsonEncode(token);
    print("User Prefernces: setUser ->$token");
    await prefs.setString(saveToken, token);
  }

  deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(saveToken);
  }
}
