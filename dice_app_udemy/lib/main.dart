import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Center(
            child: Text(
              'Dobjunk rá',
              style: TextStyle(
                  color: Colors.blueGrey.shade600,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: DiceSection(),
      ),
    );
  }
}

class DiceSection extends StatefulWidget {
  const DiceSection({super.key});

  @override
  State<DiceSection> createState() => _DiceSectionState();
}

class _DiceSectionState extends State<DiceSection> {
  int leftDice = 1;
  int rightDice = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('assets/icons/dice$leftDice.png'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightDice = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('assets/icons/dice$rightDice.png'),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        FilledButton(
          onPressed: () {
            setState(() {
              leftDice = Random().nextInt(6) + 1;
              rightDice = Random().nextInt(6) + 1;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.all(10),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          child: Text(
            'Újradobom!',
            style: TextStyle(
                color: Colors.blueGrey.shade600,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
