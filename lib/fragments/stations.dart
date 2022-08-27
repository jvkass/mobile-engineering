import 'dart:convert';

import 'package:bike_finder/entities/station.dart';
import 'package:bike_finder/widget/station_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stations extends StatefulWidget {
  const Stations({Key? key}) : super(key: key);

  @override
  StationsState createState() => StationsState();
}

class StationsState extends State<Stations> {
  @override
  Widget build(BuildContext context) {
    return projectWidget();
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<Station>> projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none && !projectSnap.hasData) {
          return Container();
        }
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: projectSnap.data != null ? projectSnap.data!.length : 0,
          itemBuilder: (context, index) {
            final Station station = projectSnap.data![index];

            return ListTile(
              title: StationTile(
                  name: station.properties!.nome!,
                  address: station.properties!.endereco!,
                  qtdBikes: station.properties!.qtdBikesTotal!),
            );
          },
        );
      },
      future: getStations(),
    );
  }

  Future<List<Station>> getStations() async {
    const url = "https://cryptic-inlet-55734.herokuapp.com/estacoes";
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<Station>((val) => Station.fromJson(val)).toList();
  }
}
