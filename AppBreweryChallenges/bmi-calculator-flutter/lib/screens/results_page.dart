import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'file:///C:/TrentonPrograms/FlutterApps/OpenSourceFlutter/AppBreweryChallenges/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsScreenArgs {
  ResultsScreenArgs(
      {@required this.bmiInterpretation,
      @required this.bmiResult,
      @required this.bmiResultText});

  final String bmiResult;
  final String bmiResultText;
  final String bmiInterpretation;
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultsScreenArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultsHeaderTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    args.bmiResultText.toUpperCase(),
                    style: kResultsWeightClassificationTextStyle,
                  ),
                  Text(
                    args.bmiResult,
                    style: kResultsBMINumberTextStyle,
                  ),
                  Center(
                    child: Text(
                      args.bmiInterpretation,
                      style: kResultsBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            label: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
