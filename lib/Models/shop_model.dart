class ShopModel {
  List<Data>? data;
  int? status;
  String? message;

  ShopModel({this.data, this.status, this.message});

  ShopModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  int? price;
  Category? category;
  String? description;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? image;

  Data(
      {this.sId,
        this.title,
        this.price,
        this.category,
        this.description,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.slug,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    description = json['description'];
    createdBy = json['createdBy'] != null
        ? CreatedBy.fromJson(json['createdBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['price'] = price;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['description'] = description;
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;

  Category({this.sId, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class CreatedBy {
  String? role;
  String? sId;
  String? name;

  CreatedBy({this.role, this.sId, this.name});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}