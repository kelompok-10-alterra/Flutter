class UserModel {
  int? userId;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? address;
  String? imageUrl;
  String? membership;
  int? point;

  UserModel(
      {this.userId,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.address,
      this.imageUrl,
      this.membership,
      this.point});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    membership = json['membership'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['imageUrl'] = imageUrl;
    data['membership'] = membership;
    data['point'] = point;
    return data;
  }
}
