import 'package:flutter/material.dart';
import 'package:bmicalculator/constant.dart';


class IconWidget extends StatelessWidget {

  IconWidget({@required this.iconData, this.label});

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: kIonSize,
          color: kIconColor,
        ),
        SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          label,
          style: kTextStyle,
        )
      ],
    );
  }
}