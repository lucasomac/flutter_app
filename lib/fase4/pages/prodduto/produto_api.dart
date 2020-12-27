import 'dart:convert';

import 'package:flutter_app/fase4/pages/prodduto/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoApi {
  static Future<List<Produto>> getProdutos() async {
    final produtos = List<Produto>();
    var url = 'https://www.macoratti.net.br/catalogo/api/produtos/v2/todos';
    var response = await http.get(url);
    List listResponse = json.decode(response.body);
    for (Map map in listResponse) {
      produtos.add(Produto.fromJson(map));
    }
    return produtos;
  }
}
