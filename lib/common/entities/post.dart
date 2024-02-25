class CreatePostRequestEntity {
  String? title;
  String? description;
  double? price;
  double? longitude;
  double? latitude;
  String? category;
  String? customerId;
  String? status;
  List<String>? images;

  CreatePostRequestEntity(
      {this.title,
      this.description,
      this.price,
      this.longitude,
      this.latitude,
      this.category,
      this.customerId,
      this.status,
      this.images});

  CreatePostRequestEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    category = json['category'];
    customerId = json['customerId'];
    status = json['status'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['category'] = category;
    data['customerId'] = customerId;
    data['status'] = status;
    data['images'] = images;
    return data;
  }
}

class CreatePostResponseEntity {
  int? code;
  Data? data;

  CreatePostResponseEntity({this.code, this.data});

  CreatePostResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? description;
  double? price;
  double? longitude;
  double? latitude;
  String? category;
  String? customerId;
  String? status;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  List<String>? customersWhoStarred;

  Data(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.longitude,
      this.latitude,
      this.category,
      this.customerId,
      this.status,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.customersWhoStarred});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    category = json['category'];
    customerId = json['customerId'];
    status = json['status'];
    images = json['images']?.cast<String>() ?? [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    customersWhoStarred = json['customersWhoStarred']?.cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['category'] = category;
    data['customerId'] = customerId;
    data['status'] = status;
    data['images'] = images;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['customersWhoStarred'] = customersWhoStarred;
    return data;
  }
}

class EditPostRequestEntity {
  String? id;
  String? title;
  String? description;
  double? price;
  double? longitude;
  double? latitude;
  String? category;
  String? customerId;
  String? status;
  List<String>? images;

  EditPostRequestEntity(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.longitude,
      this.latitude,
      this.category,
      this.customerId,
      this.status,
      this.images});

  EditPostRequestEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    category = json['category'];
    customerId = json['customerId'];
    status = json['status'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['category'] = category;
    data['customerId'] = customerId;
    data['status'] = status;
    data['images'] = images;
    return data;
  }
}

class EditPostResponseEntity {
  int? code;
  Data? data;

  EditPostResponseEntity({this.code, this.data});

  EditPostResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UnstarPostRequestEntity {
  String? listingId;
  String? customerId;

  UnstarPostRequestEntity({
    this.listingId,
    this.customerId,
  });

  UnstarPostRequestEntity.fromJson(Map<String, dynamic> json) {
    listingId = json['listingId'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['listingId'] = listingId;
    data['customerId'] = customerId;
    return data;
  }
}

class UnstarPostResponseEntity {
  int? code;
  Data? data;

  UnstarPostResponseEntity({this.code, this.data});

  UnstarPostResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
