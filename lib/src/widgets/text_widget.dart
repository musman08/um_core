import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight
  }) : super(key: key);

  final String title;
  final Color? color;
  final double ? fontSize;
  final FontWeight ? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
    title,
    style: TextStyle(
    color: color ?? Colors.black,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight,
    ),
    );
  }
}
