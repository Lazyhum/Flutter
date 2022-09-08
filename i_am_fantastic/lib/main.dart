import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xffFAF0D7),
      appBar: AppBar(
        title: Center(child: Text('I am Fantastic')),
        backgroundColor: Color(0xffF4BFBF),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/bubble-gum-workflow.gif'),
        ),
      ),
    ),
  ));
}
