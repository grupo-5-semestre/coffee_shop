import 'package:coffee_shop/pages/login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
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
              image: AssetImage('images/coffee_shop.jpg'),
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
              buildTextField(context, "EMAIL", Icons.email, false),
              buildTextField(context, "PASSWORD", Icons.lock, true),
              buildTextField(context, "CONFIRM PASSWORD", Icons.lock, true),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "Já tenho uma conta?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(height: 20.0),
              buildButton(context, "SIGN UP", Colors.black, Colors.white),
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
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
        onPressed: () {},
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
}
