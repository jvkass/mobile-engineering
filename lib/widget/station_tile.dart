import 'package:bike_finder/ui/styles.dart';
import 'package:bike_finder/widget/my_button.dart';
import 'package:flutter/material.dart';

class StationTile extends StatelessWidget {
  final String name;
  final String address;
  final String qtdBikes;

  const StationTile({Key? key, required this.name, required this.address, required this.qtdBikes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: double.infinity,
      height: 215.0,
      child: SingleChildScrollView(
        child: Column(
          children: [stationTileHeader(), buttons()],
        ),
      ),
    );
  }

  Widget stationTileHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      width: double.infinity,
      height: 130.0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            name,
            style: titleTileTextStyle,
          ),
          Text(
            address,
            style: detailTileTextStyle,
          ),
          Text(
            "Bikes disponíveis: $qtdBikes",
            style: detailTileTextStyle,
          ),
        ]),
      ),
    );
  }

  Widget buttons() {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(10),
          child: MyButton(
            label: "",
            icon: Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
            width: 62,
            height: 62,
            onClick: null,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: MyButton(
            label: "Ver no Mapa",
            width: 224,
            height: 62,
            onClick: null,
          ),
        ),
      ],
    );
  }
}
