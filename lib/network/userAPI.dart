import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class API {
  Future<User> getData() async {
    try {
      final http.Response request =
          await http.get(Uri.parse("https://fakestoreapi.com/users"));
      if (request.statusCode <= 299 && request.statusCode >= 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(request.body);
        User data = User.fromMap(jsonBody);
        return data;
      } else {
        throw ('RequestFailure ' + request.body);
      }
    } on Exception catch (e) {
      throw ('RequestFailure ' + e.toString());
    }
  }
}
