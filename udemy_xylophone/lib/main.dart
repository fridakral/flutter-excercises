import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            
            children: [
              createSoundKey('note1', Colors.red),
              createSoundKey('note2', Colors.orange),
              createSoundKey('note3', Colors.yellow),
              createSoundKey('note4', Colors.green),
              createSoundKey('note5', Colors.teal),
              createSoundKey('note6', Colors.blue),
              createSoundKey('note7', Colors.deepPurple)
            ],
          ),
        ),
      ),
    );
  }


  Expanded createSoundKey(String note, Color myColor){
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            myColor
          ),
          shape: MaterialStateProperty.all(
            LinearBorder(),
          )
        ),
        onPressed: () {
          final player = AudioPlayer();
          player.play(AssetSource('$note.wav'));
        },
        child: Container(
        )
  ),
    );
  }
}

