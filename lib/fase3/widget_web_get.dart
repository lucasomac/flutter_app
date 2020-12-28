import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

var url = "https://unsplash.com/napi/photos/Q14J2k8VE3U/related";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  Future<String> getJSONData() async {
    final String url = "https://unsplash.com/napi/photos/Q14J2k8VE3U/related";
    var response = await http.get(url);
    setState(() {
      data = json.decode(response.body)['results'];
    });
    return "Dados obtidos ocm sucesso";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http - Json"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _listView(),
    );
  }

  _listView() {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return _exibirImagem(data[index]);
      },
    );
  }

  _exibirImagem(dynamic item) => Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: item['urls']['small'],
              placeholder: (context, url) => CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fadeOutDuration: Duration(seconds: 2),
              fadeInDuration: Duration(seconds: 3),
            ),
            _criaLinhaTexto(item),
          ],
        ),
      );

  _criaLinhaTexto(dynamic item) {
    return ListTile(
      title: Text(item['description'] == null
          ? "Sem descrição fornecida"
          : item['description']),
      subtitle: Text("Likes : " + item['likes'].toString()),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }
}
