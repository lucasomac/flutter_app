import 'package:flutter/material.dart';

buildListView() {
  return ListView(
    children: [
      ListTile(
        leading: Icon(Icons.map),
        title: Text('Mapa'),
        subtitle: Text("Aplicativo de mapas"),
        selected: true,
        trailing: Icon(Icons.expand),
        onTap: () {},
        onLongPress: () {},
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Album'),
        subtitle: Text('Album de fotos'),
        trailing: Icon(Icons.expand),
        onTap: () {},
        onLongPress: () {},
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text('Fone'),
        subtitle: Text("Aplicativo do telefone"),
        trailing: Icon(Icons.expand),
        onTap: () {},
        onLongPress: () {},
      ),
    ],
  );
}

buildListViewInfinite() {
  // final itens = List<String>.generate(10000, (index) => "Item $index");
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        color: Colors.lightGreen,
        child: Text('$index'),
        // child: ListTile(
        //   leading: Icon(Icons.ac_unit),
        //   title: Text('linha ${index}'),
        //   onTap: () {
        //     debugPrint('${index} foi selecioando');
        //   },
        // ),
      );
    },
  );
}
