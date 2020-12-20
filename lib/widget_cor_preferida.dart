import 'package:flutter/material.dart';

class WidgetCorPreferida extends StatefulWidget {
  @override
  _WidgetCorPreferidaState createState() => _WidgetCorPreferidaState();
}

class _WidgetCorPreferidaState extends State<WidgetCorPreferida> {
  String nomeCor = "";

  @override
  Widget build(BuildContext context) {
    debugPrint("Mudou");
    return Scaffold(
      appBar: AppBar(
        title: Text("StateFull"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        color: Colors.yellow,
        child: Column(
          children: [
            TextField(
              onSubmitted: (String texto) {
                setState(() {
                  debugPrint("####setState chamado -> Redesenhando Widget######");
                  nomeCor = texto;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "A sua cor preferida é: $nomeCor",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
