import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }
  
  void getData() async{
    http.Response res = await http.Client().get(Uri.https('api.openweathermap.org', 'data/2.5/weather?lat=44&lon=44&appid=fabf55c4b7a58f26202d258bb9cb56c3'));
    print(res.body);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text(
            'adsfas'
          ),
        ),
      ),
    );
  }
}

/*
https://api.openweathermap.org/data/2.5/weather?lat=44&lon=44&appid=fabf55c4b7a58f26202d258bb9cb56c3
 */
