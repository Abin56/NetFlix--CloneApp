import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidgetTwo extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  const CustomButtonWidgetTwo(
      {Key? key,
      required this.icon,
      required this.title,
      required this.iconSize,
      required this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconSize,
        ),
        Text(title,
            style: TextStyle(
              fontSize: textSize,
            ))
      ],
    );
  }
}
