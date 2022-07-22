class NewsLetterModel {
  int? newsletterId;
  String? title;
  String? description;
  String? imageUrl;
  String? videoUrl;
  String? createdAt;
  String? updatedAt;

  NewsLetterModel({
    this.newsletterId,
    this.title,
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
  });

  NewsLetterModel.fromJson(Map<String, dynamic> json) {
    newsletterId = json['newsletterId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newsletterId'] = newsletterId;
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['videoUrl'] = videoUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
