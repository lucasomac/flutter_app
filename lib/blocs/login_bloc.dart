import 'package:flutter_app/api/login_api.dart';
import 'package:flutter_app/model/usuario.dart';
import 'package:http/http.dart' as http;

class LoginBloc {
  Future<Usuario> login(String login, String senha) async {
    var usuario = await LoginApi.login(login, senha);
    return usuario;
  }
}
