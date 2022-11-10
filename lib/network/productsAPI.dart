import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intermediate/model/products.dart';

class ProductsApi {
  Future<ProductsData>? getProductData() async {
    final http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      List<dynamic> body = jsonDecode(response.body);
      ProductsData products = ProductsData.fromMap(body);
      print(body);
      return products;
    } else {
      throw ('failed' + response.body);
    }
  }
}
