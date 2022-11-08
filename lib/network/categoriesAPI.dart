import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intermediate/model/products.dart';
class CategoryApi {
  Future<Products> getApiData() async {
    String? list;
    final http.Response request = await http.get(Uri.parse(
        "https://fakestoreapi.com/products/category/$list"));
    if (request.statusCode >= 200 && request.statusCode <= 299) {
      final Map<String, dynamic> jsonbody = jsonDecode(request.body);
      Products response = Products.fromMap(jsonbody);
      return response;
    } else {
      throw ('failure' + request.body);
    }
  }
}