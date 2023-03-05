import 'Ingredients.dart';
import 'Restaurants.dart';
import 'Categories.dart';

class FoodModel {
  FoodModel({
      this.id, 
      this.uuid, 
      this.name, 
      this.image, 
      this.rating, 
      this.price, 
      this.deliveryTime, 
      this.isFeatured, 
      this.restaurantId, 
      this.categoryId, 
      this.ingredients, 
      this.restaurants, 
      this.categories,});

  FoodModel.fromJson(dynamic json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
    deliveryTime = json['delivery_time'];
    isFeatured = json['isFeatured'];
    restaurantId = json['restaurantId'];
    categoryId = json['categoryId'];
    if (json['Ingredients'] != null) {
      ingredients = [];
      json['Ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    restaurants = json['restaurants'] != null ? Restaurants.fromJson(json['restaurants']) : null;
    categories = json['categories'] != null ? Categories.fromJson(json['categories']) : null;
  }
  int? id;
  String? uuid;
  String? name;
  String? image;
  int? rating;
  int? price;
  int? deliveryTime;
  bool? isFeatured;
  int? restaurantId;
  int? categoryId;
  List<Ingredients>? ingredients;
  Restaurants? restaurants;
  Categories? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    map['name'] = name;
    map['image'] = image;
    map['rating'] = rating;
    map['price'] = price;
    map['delivery_time'] = deliveryTime;
    map['isFeatured'] = isFeatured;
    map['restaurantId'] = restaurantId;
    map['categoryId'] = categoryId;
    final ingredients = this.ingredients;
    if (ingredients != null) {
      map['Ingredients'] = ingredients.map((v) => v.toJson()).toList();
    }
    final restaurants = this.restaurants;
    if (restaurants != null) {
      map['restaurants'] = restaurants.toJson();
    }
    final categories = this.categories;
    if (categories != null) {
      map['categories'] = categories.toJson();
    }
    return map;
  }

}