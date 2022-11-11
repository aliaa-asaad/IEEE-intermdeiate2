import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserAPI {
  Future<Users> getData() async {
    try {
      final http.Response request =
          await http.get(Uri.parse("https://fakestoreapi.com/users"));
      if (request.statusCode <= 299 && request.statusCode >= 200) {
        final List<dynamic> jsonBody = jsonDecode(request.body);
        Users data = Users.fromMap(jsonBody);
        return data;
      } else {
        throw ('RequestFailure ' + request.body);
      }
    } on Exception catch (e) {
      throw ('RequestFailure ' + e.toString());
    }
  }
}
