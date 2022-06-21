import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class AuthService {
  String baseUrl =
      'http://a327d060d68dc43b1bfa026001e1e330-1327007092.ap-southeast-1.elb.amazonaws.com:8081';

  // Repository Auth Login wITH HTTP

  Future<UserModel> login(
    String username,
    String password,
  ) async {
    var url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  // Repository Auth Register wITH HTTP

  Future<UserModel> register(
    String username,
    String password,
    String name,
    String email,
    String phone,
  ) async {
    var url = Uri.parse('$baseUrl/auth/register');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
        'name': name,
        'email': email,
        'phone': phone,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
