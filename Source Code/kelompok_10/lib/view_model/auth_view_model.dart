import 'package:flutter/widgets.dart';
import 'package:kelompok_10/model/token_model.dart';
import 'package:kelompok_10/service/auth_services.dart';

import '../model/user_model.dart';

enum AuthState { none, loading, hashdata, error }

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user ?? UserModel.fromJson({});

  TokenModel? _token;
  TokenModel get token => _token!;

  String? _message;
  String get message => _message!;

  AuthState _state = AuthState.none;
  AuthState get state => _state;

  setUserToken(TokenModel? user) {
    _token = user;
    notifyListeners();
  }

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _state = AuthState.loading;
    notifyListeners();
    try {
      final data = await AuthService().login(
        username,
        password,
      );
      _token = TokenModel(
        username: username,
        accessToken: data,
      );

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

  Future<UserModel> getUserByUsername(
    String username,
    String token,
  ) async {
    _state = AuthState.loading;
    notifyListeners();
    try {
      final data = await AuthService().getUserByUsername(
        username,
        token,
      );

      _state = AuthState.hashdata;
      notifyListeners();

      final datas = UserModel.fromJson(data);

      _user = datas;
      // print('User From ViewModel : $data');

      return datas;
    } catch (e) {
      _message = e.toString();
      _state = AuthState.error;
      notifyListeners();
      return UserModel.fromJson({});
    }
  }
}
