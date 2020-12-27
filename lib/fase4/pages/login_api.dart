import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String user, String senha) async {
    var url = 'https://www.macoratti.net.br/catalogo/api/contas/login';
    var hearder = {"Content-Type": "application/json"};
    Map params = {
      "username": user,
      // "username": "macoratti@yahoo.com",
      "senha": senha,
      // "senha": "Hw8vup5e@219",
      "email": user
    };
    var _body = json.encode(params);
    var response = await http.post(url, headers: hearder, body: _body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapRepsonse = json.decode(response.body);
    String mensagem = mapRepsonse["message"];
    String token = mapRepsonse["token"];

    print(mensagem);
    print(token);
  }
}
