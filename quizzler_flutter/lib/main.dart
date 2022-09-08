import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quizBrain.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade600,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: QuizzlerPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({Key? key}) : super(key: key);

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  List<Icon> scoreRecorder = [];
  /*List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  List<bool> answers = [
    false,
    true,
    true,
  ];*/
  /*List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
      q: 'Approximately one quarter of human bones are in the feet.',
      a: true,
    ),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];*/
  int num = 0;
  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userAns) {
    bool correctAnswers = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreRecorder = [];
      } else {
        if (correctAnswers == true) {
          scoreRecorder.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreRecorder.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                //enableFeedback: false,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  backgroundColor: Colors.green,
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
                //setState marks dirty read and tracks where the particular var is being
                //used then call build to refresh
              },
              style: TextButton.styleFrom(
                //enableFeedback: false,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreRecorder,
        )
      ],
    );
  }
}
