import 'package:flutter/material.dart';
import 'package:nevjegyzek_app/screens/contacts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(

        ),
      ),
      home: SafeArea(
        child: ContactsScreen(),
      ),
    );
  }
}
