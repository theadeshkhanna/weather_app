import 'package:flutter/material.dart';
import 'package:weather_app/Landing.dart';

void main() => runApp(new WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Landing(),
    );
  }
}
