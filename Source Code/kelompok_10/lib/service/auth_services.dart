import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://api.rafdev.my.id';

  login(
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

      return data;
    } catch (e) {
      throw Exception('Failed to load post');
    }
  }
}
