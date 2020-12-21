import 'package:flutter_app/wigdet_app.dart';

import 'widget_list_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
