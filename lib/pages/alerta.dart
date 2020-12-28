import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

alert(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login"),
          content: Text(msg),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            )
          ],
        );
      });
}
