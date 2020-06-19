import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_selection.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class calculator_input_section extends StatefulWidget {
  @override
  _calculator_input_sectionState createState() =>
      _calculator_input_sectionState();
}

class _calculator_input_sectionState extends State<calculator_input_section> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  //1 --> Male
  //2 --> Female
  void updateColor(int gender) {
    setState(() {
      maleCardColor = (gender == 1) ? activeCardColor : inactiveCardColor;
      femaleCardColor = (gender == 2) ? activeCardColor : inactiveCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("Card was pressed!");
                    updateColor(1);
                  },
                  child: ReusableCard(
                    color: maleCardColor,
                    cardChild: GenderSelection(
                      genderIcon: FontAwesomeIcons.mars,
                      textToDisplay: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("Card was pressed!");
                    updateColor(2);
                  },
                  child: ReusableCard(
                    color: femaleCardColor,
                    cardChild: GenderSelection(
                      genderIcon: FontAwesomeIcons.venus,
                      textToDisplay: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            color: activeCardColor,
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: activeCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: activeCardColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: bottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
        ),
      ],
    );
  }
}
