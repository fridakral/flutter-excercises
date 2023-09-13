import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/data_provider.dart';
import 'package:todoey_flutter/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) { return Data();},
      child: MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.lightBlueAccent
          )
        ),

        home: TasksScreen(),
      ),
    );
  }
}


