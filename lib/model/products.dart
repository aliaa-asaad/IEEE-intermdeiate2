import 'package:intermediate/DataBase/db_helper.dart';
import 'package:intermediate/model/rating.dart';

class ProductsData {
  List<Products>? products;
  ProductsData({this.products});

  ProductsData.fromMap(List<dynamic> map) {
    products = [];
    ((map) as List<dynamic>).forEach((element) {
      products!.add(Products.fromMap(element));
    });
  }

  Map<String, dynamic> toMap() {
    List<Map> productsList = [];
    products!.forEach((element) => productsList.add(element.toMap()));
    Map<String, dynamic> map = {'products': productsList};
    return map;
  }
}
class Products {
  //int? idtable;
   int? id;
   String? title;
   double? price;
   String? description;
   String? category;
   String? image;
   Rating? rating;
  Products({
   // this.idtable,
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  Products.fromMap(Map<String, dynamic> map) {
    //this.idtable=map[columnId];
    this.id = int.parse(map['id'].toString());
    this.title = map['title'];
    this.price = double.parse(map['price'].toString());
    this.description = map['description'];
    this.category = map['category'];
    this.image = map['image'];
    this.rating =Rating.fromMap(map['rating']);
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
