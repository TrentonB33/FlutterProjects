import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  static QuizBrain quizBrain = QuizBrain();

  String currentQuestionText = quizBrain.getCurrentQuestionText();

  void validateAnswer(bool userSelection) {
    if (quizBrain.isFinished()) {
      Alert(
              context: context,
              title: "Congratz!",
              desc: "You've Finished All the Questions!")
          .show();
      quizBrain.reset();
      setState(() {
        scoreKeeper = [];
        currentQuestionText = quizBrain.getCurrentQuestionText();
      });
    } else {
      Icon toAdd = quizBrain.validateAnswer(userSelection);

      setState(() {
        scoreKeeper.add(toAdd);
        currentQuestionText = quizBrain.getCurrentQuestionText();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 12,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQuestionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                validateAnswer(true);
                //Pressed True
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                validateAnswer(false);
                //Pressed False
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
