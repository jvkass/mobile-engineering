// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_field, prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  late String _usuario, _senha;

  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _performLogin() {
    Navigator.of(context).pushNamed('/homepage');
  }

  @override
  Widget build(BuildContext context) {
    var loginBtn = new MaterialButton(
      onPressed: _submit,
      height: 40.0,
      minWidth: double.infinity,
      color: Colors.green,
      textColor: Colors.white,
      child: new Text("ENTRAR"),
    );

    var loginForm = new ListView(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              color: Colors.blue.shade50,
              width: double.infinity,
              height: 250.0,
              child: new Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'images/bike.png',
                ),
              ),
            ),
            new Divider(
              height: 1.0,
              color: Theme.of(context).primaryColor,
            ),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        onSaved: (val) => _usuario = val!,
                        validator: (val) {
                          return val!.isEmpty ? "Digite seu usuário" : null;
                        },
                        decoration: new InputDecoration(labelText: "Usuário"),
                      ),
                      new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                      new TextFormField(
                        onSaved: (val) => _senha = val!,
                        validator: (val) {
                          return val!.isEmpty ? "Digite sua senha" : null;
                        },
                        obscureText: true,
                        decoration: new InputDecoration(labelText: "Senha"),
                      ),
                      new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                      _isLoading ? new CircularProgressIndicator() : loginBtn
                    ],
                  )),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      body: loginForm,
    );
  }
}
