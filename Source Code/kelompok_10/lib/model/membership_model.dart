class MembershipModel {
  int? membershipId;
  bool? status;
  DateTime? createdAt;
  DateTime? expiredAt;
  DateTime? updatedAt;

  MembershipModel(
      {this.membershipId,
      this.status,
      this.createdAt,
      this.expiredAt,
      this.updatedAt});

  MembershipModel.fromJson(Map<String, dynamic> json) {
    membershipId = json['membershipId'];
    status = json['status'];
    createdAt = DateTime.parse(json['createdAt'].toString());
    expiredAt = DateTime.parse(json['expiredAt'].toString());
    updatedAt = DateTime.parse(json['updated_at'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['membershipId'] = membershipId;
    data['status'] = status;
    data['createdAt'] = createdAt.toString();
    data['expiredAt'] = expiredAt.toString();
    data['updated_at'] = updatedAt.toString();
    return data;
  }
}
