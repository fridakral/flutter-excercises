import 'package:flutter/material.dart';
import 'package:udemy_quizz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: QuizSection(),
        ),
      ),
    );
  }
}

class QuizSection extends StatefulWidget {
  const QuizSection({super.key});

  @override
  State<QuizSection> createState() => _QuizSectionState();
}

class _QuizSectionState extends State<QuizSection> {
  int correct = 0;

  List<Widget> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.getCorrectAnswer() == userPickedAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        correct++;
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (quizBrain.isFinished()) {
        quizBrain.resetGame();
        int countOfQuestions = quizBrain.countTheQuestions();
        if ((correct / countOfQuestions) < 0.5) {
          Alert(
                  context: context,
                  title: '$correct / $countOfQuestions',
                  desc: "Need some practice!")
              .show();
        }else{
          Alert(
              context: context,
              title: '$correct / $countOfQuestions',
              desc: "Good job!")
              .show();
        }

        scoreKeeper.clear();
        correct=0;
      } else
        quizBrain.nextQuestion();
    });
  }
}
