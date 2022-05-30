import 'dart:convert';

class UserModel {
  final int? user_id;
  final int? id;
  final String? email;
  final String? name;
  final String? password;
  final int? phone;
  final String? username;
  final bool? active;
  final DateTime? created_at;
  final DateTime? updated_at;
  final int? role_id;

  UserModel({
    this.user_id,
    this.id,
    this.email,
    this.name,
    this.password,
    this.phone,
    this.username,
    this.active,
    this.created_at,
    this.updated_at,
    this.role_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'username': username,
      'active': active,
      'created_at': created_at?.millisecondsSinceEpoch,
      'updated_at': updated_at?.millisecondsSinceEpoch,
      'role_id': role_id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_id: map['user_id']?.toInt(),
      id: map['id']?.toInt(),
      email: map['email'],
      name: map['name'],
      password: map['password'],
      phone: map['phone']?.toInt(),
      username: map['username'],
      active: map['active'],
      created_at: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updated_at: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
      role_id: map['role_id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
