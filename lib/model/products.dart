import 'package:intermediate/model/rating.dart';
import '../DataBase/db_helper.dart';
class Products {
  int? id;
  late int? id_product;
  late String? title;
  late double? price;
  late String? description;
  late String? category;
  late String? image;
  late List<Rating>? rating;
  Products({
    this.id,
    required this.id_product,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  Products.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) {   //ده بتاع الجدول بتاع الداتا بيز مش ال id بتاع البرودكت
      this.id = map[columnId];
    }
    this.id_product = map['id'];
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
      columnId : this.id,
      "id": this.id_product,
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
