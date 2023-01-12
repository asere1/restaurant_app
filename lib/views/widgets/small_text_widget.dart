import 'package:flutter/material.dart';
import 'package:restaurant_app/utilites/colors.dart';

class SmallTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final int? maxLines;

  const SmallTextWidget(
      {Key? key,
      this.color = AppColors.textColor,
      this.size = 12,
      this.height = 1.2,
      this.maxLines,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      style: TextStyle(
          fontSize: size, fontFamily: "Roboto", color: color, height: height),
    );
  }
}
