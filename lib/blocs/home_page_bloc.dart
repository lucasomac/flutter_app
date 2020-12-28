import 'dart:async';

import 'package:flutter_app/api/produto_api.dart';
import 'package:flutter_app/model/produto.dart';

class HomePageBloc {
  final _streamController = StreamController<List<Produto>>();

  get produtosStream => _streamController.stream;
  carregaProdutos() async {
    List<Produto> produtos = await ProdutoApi.getProdutos();
    _streamController.add(produtos);
  }

  dispose() {
    _streamController.close();
  }
}
