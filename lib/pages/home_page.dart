// ignore_for_file: prefer_const_constructors, unnecessary_new, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../fragments/opcoes.dart';
import '../fragments/mapa.dart';
import '../fragments/estacoes.dart';

class MenuItem {
  String titulo;
  IconData icon;
  MenuItem(this.titulo, this.icon);
}

class HomePage extends StatefulWidget {
  final menuItens = [
    new MenuItem("HOME", Icons.home),
    new MenuItem("MAPA", Icons.map),
    new MenuItem("TODOS", Icons.list)
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  _itemSelecionado(int item) {
    setState(() {
      _selecionado = item;
    });
    Navigator.of(context).pop();
  }

  _menuItem() {
    List<Widget> menu = <Widget>[];
    for (var i = 0; i < widget.menuItens.length; i++) {
      var item = widget.menuItens[i];
      menu.add(new ListTile(
        leading: new Icon(item.icon),
        title: new Text(item.titulo),
        selected: i == _selecionado,
        onTap: () => _itemSelecionado(i),
      ));
    }
    return menu;
  }

  int _selecionado = 0;
  _carregaFragmento(int carrega) {
    switch (carrega) {
      case 0:
        return new fragmentoOne();
      case 1:
        return new fragmentoTwo();
      case 2:
        return new fragmentoTree();
      default:
        return new Text('Essa página não existe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BIKE FINDER"),
        backgroundColor: Colors.green,
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("João Vitor"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://avatars.githubusercontent.com/u/42699785?s=40&v=4"),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black87, BlendMode.multiply),
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "http://nordichouse.is/wp-content/uploads/2017/10/pexels-photo-287748.jpeg"))),
                accountEmail: new Text("bikefinder@gmail.com")),
            new Column(
              children: _menuItem(),
            )
          ],
        ),
      ),
      body: _carregaFragmento(_selecionado),
    );
  }
}
