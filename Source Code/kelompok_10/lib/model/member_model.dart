import 'package:kelompok_10/model/membership_model.dart';

class MemberModel {
  int? memberId;
  String? name;
  String? period;
  int? price;
  List<MembershipModel>? membership;
  String? createdAt;
  String? updatedAt;

  MemberModel({
    this.memberId,
    this.name,
    this.period,
    this.price,
    this.membership,
    this.createdAt,
    this.updatedAt,
  });

  MemberModel.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    name = json['name'];
    period = json['period'];
    price = json['price'];
    if (json['membership'] != null) {
      membership = <MembershipModel>[];
      json['membership'].forEach((v) {
        membership!.add(MembershipModel.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['name'] = name;
    data['period'] = period;
    data['price'] = price;
    if (membership != null) {
      data['membership'] = membership!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
