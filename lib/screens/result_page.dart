import 'package:bmi_app/app_widgets/reuable_card.dart';
import 'package:bmi_app/model/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  ResultPage({required this.bmiResult, required this.resultText, required this.resultInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              )),
          Expanded(
            flex: 5,
            child: ReuableCard(
              culor: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultInterpretation,
                    style: kbodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onPress: (){},
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                    child: Text(
                      'RE-Calculate',
                      style: kLargeButtonTextStyle,
                    )),
                color: Color(0XFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
