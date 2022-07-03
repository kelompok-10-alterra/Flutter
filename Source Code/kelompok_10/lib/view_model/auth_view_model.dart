import 'package:flutter/widgets.dart';
import 'package:kelompok_10/service/auth_services.dart';

enum AuthState { none, loading, hashdata, error }

class AuthViewModel extends ChangeNotifier {
  String? _token;

  String get token => _token!;

  String? _message;
  String get message => _message!;

  AuthState _state = AuthState.none;
  AuthState get state => _state;

  //set user token

  void setUser(String? user) {
    _token = user;
    notifyListeners();
  }

  //Login with jwt
  Future<bool> login(String username, String password) async {
    _state = AuthState.loading;
    notifyListeners();
    try {
      final data = await AuthService().login(username, password);
      _token = data['access_token'];

      _state = AuthState.hashdata;
      notifyListeners();

      return true;
    } catch (e) {
      _message = e.toString();
      _state = AuthState.error;
      notifyListeners();
      return false;
    }
  }
}
