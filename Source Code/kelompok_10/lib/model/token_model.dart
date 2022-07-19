class TokenModel {
  String? username;
  String? accessToken;

  TokenModel({this.username, this.accessToken});

  TokenModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['access_token'] = accessToken;
    return data;
  }
}
