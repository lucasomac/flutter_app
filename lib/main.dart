import 'package:flutter/material.dart';
import 'Fase 3/widget_web_get.dart';

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
