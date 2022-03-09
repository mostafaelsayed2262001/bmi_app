import 'package:bmi_app/model/CalculatorBrain.dart';
import 'package:bmi_app/app_widgets/icon_content.dart';
import 'package:bmi_app/app_widgets/reuable_card.dart';
import 'package:bmi_app/model/constant.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var maleCardColour = kActiveCardColor;
  var feMaleCardColour = kActiveCardColor;
  int height = 100;
  int weight = 70;
  int age = 60;

  void updateCardColor(int gender) {
    if (gender == 1) {
      if (maleCardColour == kInActiveCardColor) {
        maleCardColour = kActiveCardColor;
        feMaleCardColour = kInActiveCardColor;
      } else {
        maleCardColour = kInActiveCardColor;
      }
    }

    if (gender == 2) {
      if (feMaleCardColour == kInActiveCardColor) {
        feMaleCardColour = kActiveCardColor;
        maleCardColour = kInActiveCardColor;
      } else {
        feMaleCardColour = kInActiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReuableCard(
                          culor: maleCardColour,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            text: 'MALE',
                          ),
                          onPress: () {
                            setState(() {
                              updateCardColor(1);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: ReuableCard(
                          culor: feMaleCardColour,
                          cardChild: IconContent(
                            text: 'FEMALE',
                            icon: FontAwesomeIcons.venus,
                          ),
                          onPress: () {
                            setState(() {
                              updateCardColor(2);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuableCard(
                    culor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          // <<<-----
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.white,
                              activeTrackColor: Color(0XFFEB1555),
                              inactiveTickMarkColor: Color(0XFFEB1599),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 0,
                            max: 200,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReuableCard(
                          culor: kActiveCardColor,
                          cardChild: Column(
                            children: [
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          onPress: () {},
                        ),
                      ),
                      Expanded(
                        child: ReuableCard(
                          culor: kActiveCardColor,
                          cardChild: Column(
                            children: [
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          onPress: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  new CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      resultInterpretation: calc.getInterPretation(),
                    );
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: Color(0XFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  void Function()? onPressed;
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      fillColor: Color(0XFF4C4F5E),
      // shape: CircleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 60.0,
      onPressed: onPressed,
    );
  }
}
