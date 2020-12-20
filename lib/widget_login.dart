import 'package:flutter/material.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: RaisedButton(
        color: Color(0xff01a0c7),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    "images/login.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 40),
                emailField,
                SizedBox(height: 20),
                passwordField,
                SizedBox(height: 30),
                buttonLogin
              ],
            ),
          ),
        ),
      ),
    );
  }
}
