import 'dart:convert';

RoleModel roleModelFromJson(String str) => RoleModel.fromJson(json.decode(str));

String roleModelToJson(RoleModel data) => json.encode(data.toJson());

class RoleModel {
  RoleModel({
    required this.createdAt,
    required this.description,
    required this.name,
    required this.roleId,
    required this.updatedAt,
  });

  DateTime createdAt;
  String description;
  String name;
  int roleId;
  DateTime updatedAt;

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        createdAt: DateTime.parse(json["created_at"]),
        description: json["description"],
        name: json["name"],
        roleId: json["role_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "description": description,
        "name": name,
        "role_id": roleId,
        "updated_at": updatedAt.toIso8601String(),
      };
}
