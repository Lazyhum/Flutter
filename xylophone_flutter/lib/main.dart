import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  Xylophone({Key? key}) : super(key: key);

  final audioColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  void playSound(int sound) {
    final player = AudioPlayer();
    player.play(AssetSource('note$sound.mp3'));
  }

  Expanded buildKey(int note) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: audioColors[note - 1],
          enableFeedback: false,
        ),
        onPressed: () {
          playSound(note);
        },
        child: Container(),
      ),
    );
  }

  final int soundNum = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1),
              buildKey(2),
              buildKey(3),
              buildKey(4),
              buildKey(5),
              buildKey(6),
              buildKey(7),
            ],
          ),
        ),
      ),
    );
  }
}
