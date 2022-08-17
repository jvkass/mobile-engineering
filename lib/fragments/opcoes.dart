// ignore_for_file: prefer_const_constructors, unnecessary_new, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class fragmentoOne extends StatefulWidget {
  @override
  _fragmentoOneState createState() => _fragmentoOneState();
}

class _fragmentoOneState extends State<fragmentoOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Center(
      child: new Text("Fragmento 1"),
    ));
  }
}
