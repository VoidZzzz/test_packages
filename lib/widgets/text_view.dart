import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView(
      {Key? key,
      required this.text,
      this.color = Colors.white,
      this.fontWeight = FontWeight.w700,
      this.fontSize = 14})
      : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
