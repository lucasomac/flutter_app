import 'package:flutter/material.dart';

import 'fase4/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      // theme: ThemeData(primaryColor: Colors.blue),
      home: LoginPage(),
    );
  }
}
