import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final Icon? icon;
  final Function()? onClick;

  const MyButton({Key? key, required this.label, this.width, this.height, this.icon, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 150,
      child: buildButton(),
    );
  }

  Widget buildButton() {
    if (icon != null) {
      return TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(
              primary: Colors.white38,
              onSurface: Colors.white12,
              backgroundColor: Colors.deepPurple,
              elevation: 5,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          child: icon!);
    } else {
      return ElevatedButton(
        onPressed: onClick,
        style: TextButton.styleFrom(
            primary: Colors.white38,
            onSurface: Colors.white12,
            backgroundColor: Colors.green,
            elevation: 5,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        child: Text(label),
      );
    }
  }
}
