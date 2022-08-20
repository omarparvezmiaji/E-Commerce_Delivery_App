import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  var color;
  var  textAlign;

   AppText({
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign,
  })  ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign == null ? null : TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
