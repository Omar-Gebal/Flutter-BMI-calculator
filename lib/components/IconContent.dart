import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final cardText;
  final cardIcon;

  IconContent({@required this.cardText, @required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 70,
        ),
        SizedBox(height: 15),
        Text(
          cardText,
          style: kCardTextStyle,
        )
      ],
    );
  }
}
