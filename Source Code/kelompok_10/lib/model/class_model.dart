class ClassModel {
  int? classId;
  String? name;
  String? description;
  bool? status;
  int? capacity;
  int? booked;
  String? schedule;
  int? hour;
  int? price;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? typeId;
  String? typeName;
  int? instructureId;
  String? instructureName;
  int? contact;
  int? categoryId;
  String? categoryName;
  int? roomId;
  String? roomName;
  int? rating;
  String? videoUrl;
  String? meetUrl;

  ClassModel(
      {this.classId,
      this.name,
      this.description,
      this.status,
      this.capacity,
      this.booked,
      this.schedule,
      this.hour,
      this.price,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.typeId,
      this.typeName,
      this.instructureId,
      this.instructureName,
      this.contact,
      this.categoryId,
      this.categoryName,
      this.roomId,
      this.roomName,
      this.rating,
      this.videoUrl,
      this.meetUrl});

  ClassModel.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    capacity = json['capacity'];
    booked = json['booked'];
    schedule = json['schedule'];
    hour = json['hour'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    typeId = json['typeId'];
    typeName = json['typeName'];
    instructureId = json['instructureId'];
    instructureName = json['instructureName'];
    contact = json['contact'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    roomId = json['roomId'];
    roomName = json['roomName'];
    rating = json['rating'];
    videoUrl = json['videoUrl'];
    meetUrl = json['meetUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['classId'] = classId;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['capacity'] = capacity;
    data['booked'] = booked;
    data['schedule'] = schedule;
    data['hour'] = hour;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['typeId'] = typeId;
    data['typeName'] = typeName;
    data['instructureId'] = instructureId;
    data['instructureName'] = instructureName;
    data['contact'] = contact;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['roomId'] = roomId;
    data['roomName'] = roomName;
    data['rating'] = rating;
    data['videoUrl'] = videoUrl;
    data['meetUrl'] = meetUrl;
    return data;
  }
}
