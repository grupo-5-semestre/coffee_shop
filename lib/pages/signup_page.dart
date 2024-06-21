import 'package:coffee_shop/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/api/requests.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              image: const AssetImage('assets/images/coffee_shop.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100.0),
              const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.brown,
                  size: 50.0,
                ),
              ),
              buildTextField(
                  context, "EMAIL", Icons.email, false, emailController),
              buildTextField(
                  context, "SENHA", Icons.lock, true, passwordController),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text(
                  "Já tenho uma conta?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 20.0),
              buildButton(context, "Cadastrar", Colors.black, Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String labelText, IconData icon,
      bool obscureText, controller) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText:
              labelText == "EMAIL" ? 'samarthagarwal@live.com' : '*********',
          hintStyle: const TextStyle(color: Colors.grey),
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
        onPressed: () async {
          if (await Requests.cadastro(
              emailController.value.text, passwordController.value.text)) {
            Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      title: Text("Erro ao cadastrar"),
                    ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
