import 'dart:convert';

import 'user_model.dart';

InstructorModel instructorModelFromJson(String str) =>
    InstructorModel.fromJson(json.decode(str));

String instructorModelToJson(InstructorModel data) =>
    json.encode(data.toJson());

class InstructorModel {
  InstructorModel({
    required this.createdAt,
    required this.instructorId,
    required this.name,
    required this.phone,
    required this.updatedAt,
    required this.user,
  });

  DateTime createdAt;
  int instructorId;
  String name;
  String phone;
  DateTime updatedAt;
  UserModel user;

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      InstructorModel(
        createdAt: DateTime.parse(json["created_at"]),
        instructorId: json["instructor_id"],
        name: json["name"],
        phone: json["phone"],
        updatedAt: DateTime.parse(json["updated_at"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "instructor_id": instructorId,
        "name": name,
        "phone": phone,
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}
