import 'package:flutter/material.dart';
import 'package:bmi_main/constants.dart';

class iconContent extends StatelessWidget {
  iconContent({this.icon, this.label});
  final IconData? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label!,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}