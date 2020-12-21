import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'api.dart';

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((e) => User.fromJson(e)).toList();
      });
    });
  }

  _BuildListViewState() {
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuários"),
      ),
      body: listaUsuarios(),
    );
  }

  listaUsuarios() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("http://www.macoratti.net/Imagens/contato1.png"),
          ),
          title: Text(
            users[index].name,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          subtitle: Text(users[index].email),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(users[index]),
                ));
          },
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: userDetail(),
    );
  }

  userDetail() {
    return Container(
      padding: new EdgeInsets.all(32),
      child: ListTile(
        title: Text(
          user.email,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(user.username),
        leading: Icon(Icons.email, color: Colors.blue),
      ),
    );
  }
}
