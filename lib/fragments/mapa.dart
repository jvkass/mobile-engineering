import 'dart:convert';
import 'dart:math';

import 'package:bike_finder/entities/station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

const maxMarkersCount = 5000;

class fragmentoTwo extends StatefulWidget {
  @override
  _fragmentoTwoState createState() => _fragmentoTwoState();
}

class _fragmentoTwoState extends State<fragmentoTwo> {
  List<Marker> allMarkers = [];
  int _sliderVal = maxMarkersCount ~/ 10;

  @override
  void initState() {
    super.initState();

    getStations().then((value) => {
          for (Station s in value)
            {
              allMarkers.add(
                Marker(
                  point: LatLng(s.geometry!.coordinates!.last, s.geometry!.coordinates!.first),
                  builder: (context) => const Icon(
                    Icons.directions_bike,
                    color: Colors.black,
                    size: 12,
                  ),
                ),
              )
            }
        });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 0,
          max: maxMarkersCount.toDouble(),
          divisions: maxMarkersCount ~/ 500,
          label: 'Markers',
          value: _sliderVal.toDouble(),
          onChanged: (newVal) {
            _sliderVal = newVal.toInt();
            setState(() {});
          },
        ),
        Text('$_sliderVal markers'),
        Flexible(
          child: FlutterMap(
            options: MapOptions(minZoom: 10.0, center: LatLng(-3.7318616, -38.5266704)),
            layers: [
              TileLayerOptions(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(markers: allMarkers.sublist(0, min(allMarkers.length, _sliderVal)))
            ],
          ),
        ),
      ],
    );
  }

  Future<List<Station>> getStations() async {
    const url = "https://cryptic-inlet-55734.herokuapp.com/estacoes";
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<Station>((val) => Station.fromJson(val)).toList();
  }
}
