// ignore_for_file: prefer_const_constructors, unnecessary_new, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class fragmentoTwo extends StatefulWidget {
  @override
  _fragmentoTwoState createState() => _fragmentoTwoState();
}

class _fragmentoTwoState extends State<fragmentoTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new FlutterMap(
            options: new MapOptions(
                minZoom: 10.0, center: new LatLng(-3.7318616, -38.5266704)),
            layers: [
          new TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(markers: [
            new Marker(
                width: 45.0,
                height: 45.0,
                point: new LatLng(-3.7318616, -38.5266704),
                builder: (context) => new Container(
                      child: IconButton(
                          icon: Icon(Icons.accessibility),
                          onPressed: () {
                            print('Marker tapped!');
                          }),
                    )),
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
        ]));
  }
}
