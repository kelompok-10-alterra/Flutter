import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/token_model.dart';

class UserPreferences {
  final saveToken = "token";

  Future<TokenModel> getUser() async {
    final pref = await SharedPreferences.getInstance();

    Map<String, dynamic>? userMap;
    final userData = pref.getString(saveToken);
    // print("User Preferences: getUser ->$userData");

    if (userData != null) {
      userMap = jsonDecode(userData) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final user = TokenModel.fromJson(userMap);
      return user;
    }
    return TokenModel.fromJson({});
  }

  setUser(TokenModel token) async {
    final pref = await SharedPreferences.getInstance();

    final setToken = jsonEncode(token);
    // print("User Preferences: setUser ->$setToken");

    await pref.setString(saveToken, setToken);
  }

  deleteUser() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(saveToken);
  }
}
