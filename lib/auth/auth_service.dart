import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static bool isLoggedIn = false;
  static String? authToken;

  // URL do endpoint de login
  static const String loginUrl = "http://10.0.2.2:8000/api/login/";

  // Método para realizar o login e obter o token
  static Future<bool> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse(loginUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        await initLocalStorage();
        localStorage.setItem(
            'access_token', jsonDecode(response.body)["access_token"]);
        isLoggedIn = true;
        return true;
      } else {
        print('Erro ao fazer login: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
      return false;
    }
  }

  // Método para realizar o logout
  static Future<void> logout() async {
    isLoggedIn = false;
    authToken = null;
  }
}
