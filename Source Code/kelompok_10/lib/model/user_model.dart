// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.username,
    this.access_token,
  });

  String email;
  String name;
  String password;
  int phone;
  String username;
  String? access_token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        username: json["username"],
        access_token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "phone": phone,
        "username": username,
        "access_token": access_token,
      };
}
