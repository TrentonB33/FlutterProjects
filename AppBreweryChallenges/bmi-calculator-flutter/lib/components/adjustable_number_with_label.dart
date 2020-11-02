import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdjustableNumberWithLabel extends StatelessWidget {
  AdjustableNumberWithLabel(
      {this.label, this.toShow, this.decrementAction, this.incrementAction});

  final Function incrementAction;
  final Function decrementAction;
  final String label;
  final int toShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        Text(
          toShow.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: decrementAction,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: incrementAction,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
