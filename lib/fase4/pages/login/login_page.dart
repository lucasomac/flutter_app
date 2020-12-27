import 'package:flutter/material.dart';
import '../alerta.dart';
import '../home_page.dart';
import 'login_api.dart';

class LoginPage extends StatelessWidget {
  final _ctrlLogin = TextEditingController(text: "macoratti@yahoo.com");
  final _ctrlSenha = TextEditingController(text: "Hw8vup5e@2019");
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

  String _validaSenha(String texto) {
    if (texto.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }

  String _validaLogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  _raisedButton(String text, Color color, BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: () {
        _clickButton(context);
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) return;
    String login = _ctrlLogin.text;
    String senha = _ctrlSenha.text;
    var usuario = await LoginApi.login(login, senha);
    if (usuario != null) {
      _navegaHomePage(context);
    } else {
      alert(context, "Login Invalido");
    }
  }

  _navegaHomePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
