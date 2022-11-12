import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:Thermo_App/model/products.dart';

class ProductsApi {
  Future<Products>? getSingleProduct(String id) async {
    Products().id = int.parse(id);
    final http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      Map<String,dynamic> body = jsonDecode(response.body);
      Products products = Products.fromMap(body);
      print(body);
      return products;
    } else {
      throw ('failed' + response.body);
    }
  }
}
