import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBody(),
    );
  }
}


class AppBody extends StatelessWidget {
  const AppBody({super.key});




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile_pic.png'
                ),
                radius: 50,
              ),
              Text(
                'Král Friderika',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Pacifico'
                ),
              ),
              Text(
                'Munkanélküli naplopó',
                style: TextStyle(
                  fontFamily: 'Source Code Pro',
                  color: Colors.teal.shade100,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(
                height: 20,
                width: 100,
                child: Divider(
                  color: Colors.teal.shade50,
                ),
              ),
              _createInfoContainer(Icons.phone, '+44 123 4567 8901', Colors.teal),
              _createInfoContainer(Icons.mail, 'kralfrida@gmail.com', Colors.teal),

            ],
          ),
        ),
      ),
    );
  }

  Card _createInfoContainer(IconData icon, String label, Color color ){
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: color
          ),
        ),
      ),
    );
  }
}


