import 'package:flutter/cupertino.dart';

import '../preferences/user_preferences.dart';

class PreferencesViewModel extends ChangeNotifier {
  Future<String> getToken() async {
    String userData = await UserPreferences().getUser();
    notifyListeners();

    return userData;
  }

  setToken(dynamic token) async {
    await UserPreferences().setUser(token);
    notifyListeners();
  }

  deleteUser() async {
    await UserPreferences().deleteUser();
    notifyListeners();
  }
}
