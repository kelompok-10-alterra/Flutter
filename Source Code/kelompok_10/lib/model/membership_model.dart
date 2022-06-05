import 'dart:convert';

import 'user_model.dart';

MembershipModel membershipModelFromJson(String str) =>
    MembershipModel.fromJson(json.decode(str));

String membershipModelToJson(MembershipModel data) =>
    json.encode(data.toJson());

class MembershipModel {
  MembershipModel({
    required this.createdAt,
    required this.membershipId,
    required this.name,
    required this.price,
    required this.updatedAt,
    required this.user,
  });

  DateTime createdAt;
  int membershipId;
  String name;
  int price;
  DateTime updatedAt;
  UserModel user;

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      MembershipModel(
        createdAt: DateTime.parse(json["created_at"]),
        membershipId: json["membership_id"],
        name: json["name"],
        price: json["price"],
        updatedAt: DateTime.parse(json["updated_at"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "membership_id": membershipId,
        "name": name,
        "price": price,
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}
