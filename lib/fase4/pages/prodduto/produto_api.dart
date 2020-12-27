import 'dart:convert';

import 'package:flutter_app/fase4/pages/prodduto/produto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProdutoApi {
  static Future<List<Produto>> getProdutos() async {
    var url = 'https://www.macoratti.net.br/catalogo/api/produtos/v1/todos';
    List<Produto> produtos;
    var prefs = await SharedPreferences.getInstance();
    var tokenjwt = await prefs.getString("tokenjwt" ?? "");
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $tokenjwt"
    };

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      produtos = List<Produto>();
      for (Map map in listResponse) {
        produtos.add(Produto.fromJson(map));
      }
    } else {
      throw Exception;
    }
    return produtos;
  }
}
