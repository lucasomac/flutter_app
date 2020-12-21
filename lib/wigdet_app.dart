import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();
  String _infoText = "Informe o valor de cada combustível";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasolina ou Álcool?"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.directions_car,
              size: 60,
              color: Colors.orange,
            ),
            buildTextFormFieldGasolina(),
            buildTextFormFieldAlcool(),
            buildTextInfo(),
          ],
        ),
      ),
    );
  }

  buildTextFormFieldGasolina() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço da gasolina",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      controller: alcoolController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe o valor da gasolina";
        }
        return null;
      },
    );
  }

  buildTextFormFieldAlcool() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço da álcool",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      controller: alcoolController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe o valor do álcool";
        }
        return null;
      },
    );
  }

  buildContainerButton(BuildContext context) {
    return Container(
        height: 50,
        child: RaisedButton(
          onPressed: () {
            if (_formkey.currentState.validate()) {
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          },
          child: Text(
            "Calcular",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }

  buildTextInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20),
    );
  }
}
