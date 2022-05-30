import 'dart:convert';

import 'class_model.dart';
import 'user_model.dart';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    required this.bookingId,
    required this.classes,
    required this.createdAt,
    required this.date,
    required this.name,
    required this.updatedAt,
    required this.user,
  });

  int bookingId;
  ClassModel classes;
  DateTime createdAt;
  DateTime date;
  String name;
  DateTime updatedAt;
  UserModel user;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        bookingId: json["booking_id"],
        classes: ClassModel.fromJson(json["classes"]),
        createdAt: DateTime.parse(json["created_at"]),
        date: DateTime.parse(json["date"]),
        name: json["name"],
        updatedAt: DateTime.parse(json["updated_at"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "classes": classes.toJson(),
        "created_at": createdAt.toIso8601String(),
        "date": date.toIso8601String(),
        "name": name,
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}
