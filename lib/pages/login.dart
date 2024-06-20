import 'package:coffee_shop/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup_page.dart'; // Importe a classe SignupPage
import 'package:coffee_shop/pages/view_page.dart'; // Importe a classe Page

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Realiza o login utilizando o AuthService
    bool loggedIn = await AuthService.login(email, password);

    if (loggedIn) {
      // Se o login for bem-sucedido, navega para a Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ViewPage()),
      );
    } else {
      // Caso contrário, exibe uma mensagem de erro
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Login'),
            content: Text('Credenciais inválidas. Por favor, tente novamente.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.05),
                BlendMode.dstATop,
              ),
              image: AssetImage('assets/images/coffee_shop.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.brown,
                  size: 50.0,
                ),
              ),
              SizedBox(height: 20.0),
              buildTextField(context, "EMAIL", Icons.email, false),
              SizedBox(height: 20.0),
              buildTextField(context, "PASSWORD", Icons.lock, true),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // Navega para a tela de signup
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(height: 20.0),
              buildButton(context, "LOGIN", Colors.black, Colors.white),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Entre com:",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildSocialButton(context, "FACEBOOK",
                      FontAwesomeIcons.facebookF, Colors.blue),
                  SizedBox(width: 10.0),
                  buildSocialButton(
                      context, "GOOGLE", FontAwesomeIcons.google, Colors.red),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      BuildContext context, String labelText, IconData icon, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: TextField(
        controller: labelText == "EMAIL" ? emailController : passwordController,
        obscureText: obscureText,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText:
              labelText == "EMAIL" ? 'samarthagarwal@live.com' : '*********',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String label, Color bgColor, Color textColor) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          login(context); // Chama o método login ao pressionar o botão
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton(
      BuildContext context, String label, IconData icon, Color bgColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(
                  icon,
                  color: Colors.white,
                  size: 15.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
