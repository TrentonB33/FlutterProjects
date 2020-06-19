import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Style of the label that is displayed below the icon
const LabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class GenderSelection extends StatelessWidget {
  GenderSelection({this.genderIcon, this.textToDisplay});

  final IconData genderIcon;
  final String textToDisplay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textToDisplay,
          style: LabelStyle,
        )
      ],
    );
  }
}
