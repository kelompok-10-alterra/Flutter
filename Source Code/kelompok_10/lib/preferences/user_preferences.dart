import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/token_model.dart';

class UserPreferences {
  final saveToken = "token";

  Future<TokenModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, dynamic>? userMap;
    final userData = prefs.getString(saveToken);
    print("User Prefernces: getUser ->$userData");

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
    final prefs = await SharedPreferences.getInstance();

    final setToken = jsonEncode(token);
    print("User Prefernces: setUser ->$setToken");

    await prefs.setString(saveToken, setToken);
  }

  deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(saveToken);
  }
}
