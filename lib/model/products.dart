import 'package:intermediate/model/rating.dart';

class ProductsData {
  List<Products>? products;
  ProductsData({this.products});

  ProductsData.fromMap(List<dynamic> map) {
    print('1');
    products = [];
    print('2');
    ((map) as List<dynamic>).forEach((element) {
      products!.add(Products.fromMap(element));
    });
    print('3');
  }

  Map<String, dynamic> toMap() {
    List<Map> productsList = [];
    print('4');
    products!.forEach((element) => productsList.add(element.toMap()));
    Map<String, dynamic> map = {'products': productsList};
    print('5');
    return map;
  }
}

class Products {
  late int? id;
  late String? title;
  late double? price;
  late String? description;
  late String? category;
  late String? image;
  late Rating? rating;
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
    print('4');
    this.id = map['id'];
    print('5');
    this.title = map['title'];
    print('6');
    this.price = double.parse(map['price'].toString());
    print('7');
    this.description = map['description'];
    print('8');
    this.category = map['category'];
    print('9');
    this.image = map['image'];
    print('10');
    this.rating = Rating.fromMap(map['rating']);
    print('15');
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "title": this.title,
      "price": this.price,
      "description": this.description,
      "category": this.category,
      "image": this.image,
      "rating": this.rating!.toMap(),
    };
    return map;
  }
}
