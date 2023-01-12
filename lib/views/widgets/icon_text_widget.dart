import 'package:flutter/material.dart';
import 'package:restaurant_app/utilites/dimensions.dart';
import 'package:restaurant_app/views/widgets/small_text_widget.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.icon24,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallTextWidget(
          text: text,
        )
      ],
    );
  }
}
