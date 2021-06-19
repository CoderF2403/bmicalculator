import 'package:bmicalculator/CustomWidgets/RoundIconButton.dart';
import 'package:bmicalculator/result.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/CustomWidgets/reusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/CustomWidgets/iconWidget.dart';
import 'package:bmicalculator/constant.dart';
import 'package:bmicalculator/bmiBrain.dart';


enum Gender{male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kReusableCardColorInactive;
  Color femaleCardColor = kReusableCardColorInactive;

  // 1 == male, 2 == female
  void updateColor(Gender gender){
    if (gender == Gender.male){
      if (maleCardColor == kReusableCardColorInactive){
        maleCardColor = kReusableCardColorActive;
        femaleCardColor = kReusableCardColorInactive;
      }else{
        maleCardColor = kReusableCardColorInactive;
      }
    }
    if (gender == Gender.female){
      if (femaleCardColor == kReusableCardColorInactive){
        femaleCardColor = kReusableCardColorActive;
        maleCardColor = kReusableCardColorInactive;
      }else{
        femaleCardColor = kReusableCardColorInactive;
      }
    }
  }

  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      color1: maleCardColor,
                      cardChild: IconWidget(
                        iconData: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      color1: femaleCardColor,
                      cardChild: IconWidget(
                        iconData: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color1: kReusableCardColorInactive,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kTextStyleOne,
                            ),
                            Text(
                              'cm',
                              style: kTextStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 300.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color1: kReusableCardColorInactive,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyleOne,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color1: kReusableCardColorInactive,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyleOne,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              print(calc.calculateBMI());
              String result = calc.getResult();
              String interpretation = calc.getInterpretation();
              String value = calc.calculateBMI();

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                    bmiValue: value,
                    bmiResult: result,
                    bmiInterpretation: interpretation)
              ));
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
                    'CALCULATE',
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
