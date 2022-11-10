import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intermediate/model/products.dart';

class CategoryApi {
  Future<ProductsData> getApiData(String? list) async {
    final http.Response request;
    if (list == '')
      request = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    else
      request = await http
          .get(Uri.parse("https://fakestoreapi.com/products/category/${list}"));
    if (request.statusCode >= 200 && request.statusCode <= 299) {
      final List<dynamic> jsonbody = jsonDecode(request.body);
      ProductsData response = ProductsData.fromMap(jsonbody);
      return response;
    } else {
      throw ('failure' + request.body);
    }
  }
}
