import 'package:flutter/material.dart';
import 'Weather.dart';

void main () => runApp(new WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Weather(),
    );
  }
}