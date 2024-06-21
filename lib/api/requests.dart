import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class Requests {
  static const String get = "GET";
  static const String post = "POST";

  // get all products
  static Future<List<dynamic>> getProducts() async {
    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/products"),
      headers: {
        'Authorization': 'Bearer ${localStorage.getItem('access_token')}',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    }

    return [];
  }

  // get all products
  static Future<List<dynamic>> getOrders() async {
    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/orders"),
      headers: {
        'Authorization': 'Bearer ${localStorage.getItem('access_token')}',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    }

    return [];
  }

  static Future<bool> cadastro(String email, String password) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/users/"),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
