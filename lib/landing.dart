import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
final String temp;

Landing(this.temp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('weather'),
      ),
      body: Column(
        children: <Widget>[
          Text(temp)
        ],
      ),
    );
  }
}