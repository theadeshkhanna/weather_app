import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather extends StatelessWidget {
  final String url = 'http://api.openweathermap.org/data/2.5/weather?q=Varanasi&units=metric&appid=c4d43f47ca2c4387e922975a2bf99380';

  void value() {
     http.get(url).then((http.Response response) {
       print(response.body); 
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('click', style: TextStyle(color: Colors.white)),
              onPressed: value,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}