import 'package:flutter/material.dart';
import 'package:bmicalculator/constant.dart';



class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.color1, this.cardChild});

  final Color color1;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(kMarginAll),
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
    );
  }
}