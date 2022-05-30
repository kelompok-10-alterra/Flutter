import 'dart:convert';

class RoleModel {
  final int? role_id;
  final String? name;
  final String? description;
  final DateTime? created_at;
  final DateTime? updated_at;

  RoleModel({
    this.role_id,
    this.name,
    this.description,
    this.created_at,
    this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'role_id': role_id,
      'name': name,
      'description': description,
      'created_at': created_at?.millisecondsSinceEpoch,
      'updated_at': updated_at?.millisecondsSinceEpoch,
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      role_id: map['role_id']?.toInt(),
      name: map['name'],
      description: map['description'],
      created_at: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updated_at: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source));
}
