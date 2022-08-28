// ignore_for_file: prefer_const_constructors, unnecessary_new, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:bike_finder/entities/station.dart';
import 'package:http/http.dart' as http;

class fragmentoTwo extends StatefulWidget {
  @override
  _fragmentoTwoState createState() => _fragmentoTwoState();
}

class _fragmentoTwoState extends State<fragmentoTwo> {
  @override
  Widget build(BuildContext context) {
    var stations = getStations();

    return Container(
      child: new FlutterMap(
          options: new MapOptions(
              minZoom: 10.0, center: new LatLng(-3.7318616, -38.5266704)),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(-3.7321944, -38.510347),
                  builder: (context) => new Container(
                        child: IconButton(
                            icon: Icon(Icons.directions_bike),
                            onPressed: () {
                              print('Marker tapped 2!');
                            }),
                      ))
            ])
          ]),
    );
  }

  Future<List<Station>> getStations() async {
    const url = "https://cryptic-inlet-55734.herokuapp.com/estacoes";
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<Station>((val) => Station.fromJson(val)).toList();
  }
}
