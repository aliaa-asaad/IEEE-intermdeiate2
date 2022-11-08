import 'package:intermediate/model/rating.dart';

class Categories {
  late int id;
  late String title;
  late int price;
  late String description;
  late String category;
  late String image;
  late List<Rating> rating;

  Categories({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Categories.FromJson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.price = map["price"];
    this.description = map["description"];
    this.category = map["category"];
    this.image = map["image"];
    this.rating = [];
    (map["rating"] ).forEach((element) {
      this.rating.add(Rating.FromJson(element));
    });
  }

  Map<String, dynamic> ToJson() {
    List<Map> list = [];
    this.rating.forEach((element) {
      list.add(element.ToJson());
    });
    Map<String, dynamic> map = {
      "id": this.id,
      "title": this.title,
      "price": this.price,
      "description": this.description,
      "category": this.category,
      "image": this.image,
      "rating": list,
    };
    return map;
  }
}
