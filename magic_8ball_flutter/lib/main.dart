import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            title: const Text('Ask Me Anything'),
          ),
          body: const Ball(),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNum = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                ballNum = Random().nextInt(5) + 1;
                print(ballNum);
              });
            },
            child: Expanded(
              child: Image.asset('images/ball$ballNum.png'),
            ),
          ),
        ],
      ),
    );
  }
}
