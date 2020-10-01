import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_selection.dart';
import 'constants.dart';

class calculator_input_section extends StatefulWidget {
  @override
  _calculator_input_sectionState createState() =>
      _calculator_input_sectionState();
}

class _calculator_input_sectionState extends State<calculator_input_section> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 180;

  //1 --> Male
  //2 --> Female
  void updateColor(int gender) {
    setState(() {
      maleCardColor = (gender == 1) ? kActiveCardColor : kInactiveCardColor;
      femaleCardColor = (gender == 2) ? kActiveCardColor : kInactiveCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
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
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(),
                  child: Slider(
                    value: height.toDouble(),
                    min: kMinHeight,
                    max: kMaxHeight,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kBottomContainerHeight,
        ),
      ],
    );
  }
}
