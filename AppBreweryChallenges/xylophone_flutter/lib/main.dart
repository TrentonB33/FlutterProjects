import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Widget buildKey(Color myColor, String myNote) {
    return NoteButton(
      color: myColor,
      note: myNote,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildKey(Colors.red, 'note1.wav'),
              buildKey(Colors.orange, 'note2.wav'),
              buildKey(Colors.yellow, 'note3.wav'),
              buildKey(Colors.green, 'note4.wav'),
              buildKey(Colors.teal, 'note5.wav'),
              buildKey(Colors.blue, 'note6.wav'),
              buildKey(Colors.purple, 'note7.wav'),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  const NoteButton({this.color, this.note});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: this.color,
        onPressed: () {
          final player = AudioCache();
          player.play('$note');
        },
        child: Container(),
      ),
    );
  }

  final Color color;
  final String note;
}
