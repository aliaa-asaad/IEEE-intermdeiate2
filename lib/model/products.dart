import 'package:intermediate/model/rating.dart';

class Products {
  late int? id;
  late String? title;
  late double? price;
  late String? description;
  late String? category;
  late String? image;
  late List<Rating>? rating;
  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  Products.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.price = map['price'];
    this.description = map['description'];
    this.category = map['category'];
    this.image = map['image'];
    this.rating = [];
    (map['rating'] as List).forEach((element) {
      this.rating!.add(Rating.fromMap(element));
    });
  }
  Map<String, dynamic> toMap() {
    List<Map> ratingList = [];
    this.rating!.forEach((element) {
      ratingList.add(element.toMap());
    });
    Map<String, dynamic> map = {
      "id": this.id,
      "title": this.title,
      "price": this.price,
      "description": this.description,
      "category": this.category,
      "image": this.image,
      "ratind": this.rating,
    };
    return map;
  }
}
