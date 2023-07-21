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
        backgroundColor: Colors.blueGrey.shade400,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: Text(
            'Magic 8 Ball'
          ),
        ),
        body: BallSection(),
      ),
    );
  }
}

class BallSection extends StatefulWidget {
  const BallSection({super.key});

  @override
  State<BallSection> createState() => _BallSectionState();
}

class _BallSectionState extends State<BallSection> {

  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextButton(
            child: Image.asset(
              'assets/images/ball$ballNumber.png'
            ),
            onPressed: (){
              setState(() {
                ballNumber = Random().nextInt(5)+1;
              });
            },
          ),
        ),
      ),
    );
  }
}
