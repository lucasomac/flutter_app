import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Acesso",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            _textFormField(
              "Login",
              "Digite o Login",
              _ctrlLogin,
              _validaLogin,
            ),
            _textFormField(
              "Senha",
              "Digite a Senha",
              _ctrlSenha,
              _validaSenha,
              true,
            ),
            _raisedButton("Login", Colors.orange, context)
          ],
        ),
      ),
    );
  }

  _textFormField(String label, String hint, TextEditingController controller,
      FormFieldValidator<String> validator,
      [bool senha = false]) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: senha,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  _validaSenha(String texto) {
    if (texto.isEmpty) {
      return "Digite a senha";
    }
  }

  _validaLogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  _raisedButton(String text, Color color, BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
