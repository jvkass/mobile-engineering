import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../fragments/estacoes.dart';
import '../fragments/mapa.dart';
import '../fragments/opcoes.dart';

class MenuItem {
  String titulo;
  IconData icon;

  MenuItem(this.titulo, this.icon);
}

class HomePage extends StatefulWidget {
  final User user;

  HomePage({Key? key, required this.user}) : super(key: key);

  final menuItens = [MenuItem("HOME", Icons.home), MenuItem("MAPA", Icons.map), MenuItem("TODOS", Icons.list)];

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
        return fragmentoOne();
      case 1:
        return fragmentoTwo();
      case 2:
        return fragmentoTree();
      default:
        return Text('Essa página não existe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BIKE FINDER"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                accountName: Text("João Vitor"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/42699785?s=40&v=4"),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black87, BlendMode.multiply),
                        fit: BoxFit.fill,
                        image:
                            NetworkImage("http://nordichouse.is/wp-content/uploads/2017/10/pexels-photo-287748.jpeg"))),
                accountEmail: Text("bikefinder@gmail.com")),
            Column(
              children: _menuItem(),
            )
          ],
        ),
      ),
      body: _carregaFragmento(_selecionado),
    );
  }
}
