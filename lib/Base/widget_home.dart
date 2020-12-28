import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState("Base", Colors.red);
}

class _HomeState extends State<Home> {
  String _title;
  Color _color;
  _HomeState(this._title, this._color);
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
