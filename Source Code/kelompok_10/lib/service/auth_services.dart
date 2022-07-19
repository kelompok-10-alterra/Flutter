import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../model/token_model.dart';

class AuthService {
  String baseUrl = 'https://api.rafdev.my.id';

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
      // print('User Services 47 : ${response.data} ${response.statusCode}');

      final data = response.data;

      // print('User From data services : $data');

      return data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
