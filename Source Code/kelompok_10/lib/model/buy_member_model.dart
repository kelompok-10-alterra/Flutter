class BuyMember {
  int? userId;
  int? memberId;
  int? total;
  String? method;

  BuyMember({
    this.userId,
    this.memberId,
    this.total,
    this.method,
  });

  BuyMember.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    memberId = json['memberId'];
    total = json['total'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['memberId'] = memberId;
    data['total'] = total;
    data['method'] = method;
    return data;
  }
}
