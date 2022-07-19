import 'package:flutter/cupertino.dart';

import '../model/token_model.dart';
import '../preferences/user_preferences.dart';

class PreferencesViewModel extends ChangeNotifier {
  TokenModel? _token;
  TokenModel get token => _token!;

  Future<TokenModel> getToken() async {
    TokenModel userData = await UserPreferences().getUser();
    notifyListeners();

    // print(userData);

    _token = userData;

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
