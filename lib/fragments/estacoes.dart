// ignore_for_file: prefer_const_constructors, unnecessary_new, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:bike_finder/widget/station_tile.dart';
import 'package:flutter/material.dart';

class estacoes extends StatefulWidget {
  @override
  _estacoesState createState() => _estacoesState();
}

class _estacoesState extends State<estacoes> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return ListTile(
            title: StationTile(

            ),
          );

        }
    );
  }
}