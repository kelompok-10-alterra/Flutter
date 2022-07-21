// ignore_for_file: avoid_print

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

  String? _confirmToken;
  String get confirmToken => _confirmToken ?? '';

  String? _checkVerif;
  String get checkVerif => _checkVerif ?? '';

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

  //register
  Future<bool> register(
    String name,
    String username,
    String email,
    String phone,
    String password,
  ) async {
    _state = AuthState.loading;
    notifyListeners();

    try {
      final data = await AuthService().register(
        name,
        username,
        email,
        phone,
        password,
      );

      _confirmToken = data;
      notifyListeners();

      _state = AuthState.hashdata;
      notifyListeners();

      return true;
    } catch (e) {
      _message = e.toString();
      _state = AuthState.error;
      print('Akun Telah Terdaftar');
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

  Future<String> verifyEmail(
    String token,
  ) async {
    _state = AuthState.loading;
    notifyListeners();

    try {
      final data = await AuthService().verifyEmail(_confirmToken.toString());

      print(data);

      if (data == 'Verify Success') {
        _state = AuthState.hashdata;
        notifyListeners();
      } else {
        _message = data;
        _state = AuthState.error;
        notifyListeners();
      }

      _checkVerif = data;

      return data;
    } catch (e) {
      _message = e.toString();
      _state = AuthState.error;
      notifyListeners();
      return '';
    }
  }
}
