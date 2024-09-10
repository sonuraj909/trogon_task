import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    required this.fontSize,
    this.color,
    this.decoration,
    this.decorationColor,
    this.maxLines = 1,
  });

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double fontSize;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
