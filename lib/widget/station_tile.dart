import 'package:flutter/material.dart';

class StationTile extends StatelessWidget {
  const StationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Linha 1",
            style: TextStyle(color: Colors.black),
          ),
          Text("Linha 2"),
          Text("Linha 3"),
          Text("Linha 4"),
          Row(
            children: [
              Text("Linha 5"),
              Text("Linha 6"),
            ],
          )
        ],
      ),
      decoration: const BoxDecoration(color: Colors.green //white,
      ),
      width: double.infinity,
      height: 250.0,
    );
  }
}