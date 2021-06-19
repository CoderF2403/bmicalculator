import 'package:flutter/material.dart';
import 'package:bmicalculator/constant.dart';
import 'package:bmicalculator/CustomWidgets/reusableCard.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult, @required this.bmiInterpretation, @required this.bmiValue});

  final String bmiResult;
  final String bmiInterpretation;
  final String bmiValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
                margin: EdgeInsets.only(top: 30.0, left: 30.0),
                  child: Text(
                    'YOUR RESULT',
                    style: kTextStyleOne,
                  ),
                ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color1: Color(0xFF111328),
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        bmiResult,
                    style: kBmiTitle,
                    ),
                    Text(
                      bmiValue,
                      style: kBmiValue,
                    ),
                    Text(
                      bmiInterpretation,
                      style: kBmiRemarks,
                    )
                  ],
                ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/mainPage');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              height: kBottomContainerHeight,
              width: kBottomContainerWidth,
              decoration: BoxDecoration(
                color: Color(kBottomContainerColor),
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Center(
                child: Text(
                  'RE - CALCULATE',
                  style: kTextStyleOne,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
