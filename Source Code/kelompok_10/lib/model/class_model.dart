import 'dart:convert';

import 'instructor_model.dart';

ClassModel classModelFromJson(String str) =>
    ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  ClassModel({
    required this.category,
    required this.classId,
    required this.createdAt,
    required this.description,
    required this.instructor,
    required this.name,
    required this.updatedAt,
  });

  String category;
  int classId;
  DateTime createdAt;
  String description;
  InstructorModel instructor;
  String name;
  DateTime updatedAt;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        category: json["category"],
        classId: json["class_id"],
        createdAt: DateTime.parse(json["created_at"]),
        description: json["description"],
        instructor: InstructorModel.fromJson(json["instructor"]),
        name: json["name"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "class_id": classId,
        "created_at": createdAt.toIso8601String(),
        "description": description,
        "instructor": instructor.toJson(),
        "name": name,
        "updated_at": updatedAt.toIso8601String(),
      };
}
