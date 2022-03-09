import 'package:bmi_app/model/constant.dart';
import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;
  IconContent({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

