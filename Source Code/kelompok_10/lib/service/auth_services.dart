// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../model/token_model.dart';
import '../theme/utils.dart';

class AuthService {
  Dio dio = Dio();

  Future<String> login(
    String username,
    String password,
  ) async {
    var url = Uri.parse('$baseUrl/auth/login');
    try {
      var response = await http.post(
        url,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );

      final data = json.decode(response.body);

      TokenModel user = TokenModel();
      user.accessToken = data['access_token'];

      return user.accessToken ?? '';
    } catch (e) {
      throw Exception('Failed to load post');
    }
  }

  //Register with dio
  Future<String> register(
    String name,
    String username,
    String email,
    String phone,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        '$baseUrl/auth/register',
        options: Options(headers: {
          'Content-Type': "application/json",
        }),
        data: {
          'name': name,
          'username': username,
          'email': email,
          'phone': phone,
          'password': password,
          'address': "Alamat belum diisi",
        },
      );
      print('response: ${response.data} ${response.statusCode}');

      final data = response.data.toString();

      return data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getUserByUsername(
    String username,
    String token,
  ) async {
    String url =
        '$baseUrl/capstone/user/userAccess/getUserByUsername?username=$username';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer ' '$token'},
        ),
      );

      final data = response.data;

      return data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<String> verifyEmail(String token) async {
    String url = '$baseUrl/auth/confirmToken?token=$token';
    try {
      Response response = await dio.get(
        url,
        // queryParameters: {
        //   'token': token.trim(),
        // },
      );

      print('response Verification: ${response.data} ${response.statusCode}');

      final data = response.data.toString();

      return data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
