import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int loadDiceValue1 = 1;
  int loadDiceValue2 = 1;

  void changeDice() {
    setState(() {
      loadDiceValue1 = Random().nextInt(6) + 1;
      loadDiceValue2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    changeDice();
                  },
                  child: Image.asset('images/dice$loadDiceValue1.png'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    changeDice();
                  },
                  child: Image.asset('images/dice$loadDiceValue2.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
