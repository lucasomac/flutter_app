import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      // theme: ThemeData(primaryColor: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  Future<String> getJSONData() async {
    final String url = "https://unsplash.com/napi/photos/Q14J2k8VE3U/related";
    var response = await http.get(url);
    data = json.decode(response.body);
    print(data);
    return "Dados obtidos ocm sucesso";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Http - Json"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
