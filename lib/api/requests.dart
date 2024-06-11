import 'dart:convert';

import 'package:http/http.dart' as http;

class Requests {
  static const String get = "GET";
  static const String post = "POST";

  // get all products
  static Future<List<dynamic>> getProducts() async {
    var response =
        await http.get(Uri.parse("http://10.0.2.2:8000/api/products"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    }

    return [];
  }
}
