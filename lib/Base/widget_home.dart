import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  String title;
  Color color;
  Widget body;
  Home(this.title, this.color, this.body);
  @override
  _HomeState createState() => _HomeState(title, color, body);
}

class _HomeState extends State<Home> {
  String _title;
  Color _color;
  Widget _body;
  _HomeState(this._title, this._color, this._body);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(_title),
      centerTitle: true,
      backgroundColor: _color,
    ));
  }
}
