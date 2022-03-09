import 'package:flutter/cupertino.dart';

class ReuableCard extends StatelessWidget {
  Color culor;
  Widget cardChild;
  void Function()? onPress;

  ReuableCard({required this.culor, required this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: culor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
