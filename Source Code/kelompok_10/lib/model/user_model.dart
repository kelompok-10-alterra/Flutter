import 'dart:convert';

import 'package:kelompok_10/model/role_model.dart';

import 'authority_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.active,
    required this.authorities,
    required this.createdAt,
    required this.credentialsNonExpired,
    required this.email,
    required this.enabled,
    required this.name,
    required this.password,
    required this.phone,
    required this.role,
    required this.updatedAt,
    required this.userId,
    required this.username,
  });

  bool accountNonExpired;
  bool accountNonLocked;
  bool active;
  List<Authority> authorities;
  DateTime createdAt;
  bool credentialsNonExpired;
  String email;
  bool enabled;
  String name;
  String password;
  int phone;
  RoleModel role;
  DateTime updatedAt;
  int userId;
  String username;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        active: json["active"],
        authorities: List<Authority>.from(
            json["authorities"].map((x) => Authority.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        credentialsNonExpired: json["credentialsNonExpired"],
        email: json["email"],
        enabled: json["enabled"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        role: RoleModel.fromJson(json["role"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "active": active,
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "credentialsNonExpired": credentialsNonExpired,
        "email": email,
        "enabled": enabled,
        "name": name,
        "password": password,
        "phone": phone,
        "role": role.toJson(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "username": username,
      };
}
