import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/home_page_bloc.dart';
import 'package:flutter_app/model/produto.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = HomePageBloc();

  @override
  void initState() {
    super.initState();
    _bloc.carregaProdutos();
  }

  @override
  dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catálogo de produtos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return StreamBuilder(
        stream: _bloc.produtosStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(child: Text("Erro ao acessar os dados"));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Produto> produtos = snapshot.data;
          return _listView(produtos);
        });
  }

  _listView(List<Produto> produtos) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: produtos != null ? produtos.length : 0,
        itemBuilder: (context, index) {
          Produto p = produtos[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    p.imagemUrl,
                    width: 150,
                  ),
                ),
                Text(
                  p.nome,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  p.descricao,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  p.preco.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                ButtonBarTheme(
                  data: ButtonBarThemeData(),
                  child: ButtonBar(
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text("Detalhes"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
