import 'package:weather_project/screens/city_screen.dart';
import 'package:weather_project/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
