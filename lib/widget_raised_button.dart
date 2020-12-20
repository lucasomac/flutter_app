import 'package:flutter/material.dart';

widgetButton() {
  return RaisedButton(
    child: Text("OK"),
    color: Colors.red,
    disabledColor: Colors.orangeAccent,
    textColor: Colors.white,
    elevation: 20,
    onPressed: () => exibirTexto("pressionado"),
  );
}

exibirTexto(String msg) {
  print(msg);
}
