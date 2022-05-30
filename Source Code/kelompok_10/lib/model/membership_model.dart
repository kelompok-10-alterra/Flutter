import 'dart:convert';

class MembershipModel {
  final int? membership_id;
  final int? user_id;
  final String? name;
  final int? price;
  final DateTime? created_at;
  final DateTime? updated_at;

  MembershipModel(
    this.membership_id,
    this.user_id,
    this.name,
    this.price,
    this.created_at,
    this.updated_at,
  );

  Map<String, dynamic> toMap() {
    return {
      'membership_id': membership_id,
      'user_id': user_id,
      'name': name,
      'price': price,
      'created_at': created_at?.millisecondsSinceEpoch,
      'updated_at': updated_at?.millisecondsSinceEpoch,
    };
  }

  factory MembershipModel.fromMap(Map<String, dynamic> map) {
    return MembershipModel(
      map['membership_id']?.toInt(),
      map['user_id']?.toInt(),
      map['name'],
      map['price']?.toInt(),
      map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MembershipModel.fromJson(String source) =>
      MembershipModel.fromMap(json.decode(source));
}
