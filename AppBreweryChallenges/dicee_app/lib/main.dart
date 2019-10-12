import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DicePane();
  }
}

class DicePane extends StatefulWidget {
  @override
  _DicePaneState createState() => _DicePaneState();
}

class _DicePaneState extends State<DicePane> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int sum = 2;
  String doubles = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$doubles',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: dicePressed,
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: dicePressed,
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ),
        Text(
          'You rolled: $sum',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void dicePressed() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      sum = leftDiceNumber + rightDiceNumber;
      if (leftDiceNumber == rightDiceNumber) {
        doubles = 'Doubles!';
      } else {
        doubles = '';
      }
    });
  }
}
