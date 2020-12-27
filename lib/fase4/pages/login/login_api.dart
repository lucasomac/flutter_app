import 'dart:convert';
import 'package:flutter_app/fase4/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String user, String senha) async {
    var url = 'https://www.macoratti.net.br/catalogo/api/contas/login';
    var hearder = {"Content-Type": "application/json"};
    Map params = {"username": user, "senha": senha, "email": user};
    var _body = json.encode(params);
    var response = await http.post(url, headers: hearder, body: _body);
    Map mapRepsonse = json.decode(response.body);
    if (response.statusCode == 200) {
      final usuario = Usuario.fromJson(mapRepsonse);
      return usuario;
    } else {
      return null;
    }
  }
}
