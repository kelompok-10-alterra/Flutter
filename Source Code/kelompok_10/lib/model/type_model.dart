class TypeModel {
  int? typeId;
  String? name;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  TypeModel({
    this.typeId,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  TypeModel.fromJson(Map<String, dynamic> json) {
    typeId = json['typeId'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['typeId'] = typeId;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
