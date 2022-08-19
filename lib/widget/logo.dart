import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      width: double.infinity,
      height: 250.0,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Image.asset(
          'images/bike.png',
        ),
      ),
    );
  }
}
