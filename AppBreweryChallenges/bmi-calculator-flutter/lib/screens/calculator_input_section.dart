import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender_selection.dart';
import '../constants.dart';
import '../components/adjustable_number_with_label.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class calculator_input_section extends StatefulWidget {
  @override
  _calculator_input_sectionState createState() =>
      _calculator_input_sectionState();
}

class _calculator_input_sectionState extends State<calculator_input_section> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 24;

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
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: kInactiveTrackColor,
                    thumbColor: kThumbColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: overlayColor,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: kMinHeight,
                    max: kMaxHeight,
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
                  cardChild: AdjustableNumberWithLabel(
                    label: 'WEIGHT',
                    toShow: weight,
                    decrementAction: () {
                      setState(() {
                        weight--;
                      });
                    },
                    incrementAction: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: AdjustableNumberWithLabel(
                    label: 'AGE',
                    toShow: age,
                    decrementAction: () {
                      setState(() {
                        age--;
                      });
                    },
                    incrementAction: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          label: 'CALCULATE',
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(
              weight: weight,
              height: height,
            );

            Navigator.pushNamed(context, '/results',
                arguments: ResultsScreenArgs(
                    bmiResult: calc.calculateBMI(),
                    bmiInterpretation: calc.getInterpretation(),
                    bmiResultText: calc.getResult()));
          },
        )
      ],
    );
  }
}
