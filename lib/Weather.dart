import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeatherCreateState();
  }
}

class _WeatherCreateState extends State<Weather> {
  String cityValue;
  String temperature;

  void temp() {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityValue&units=metric&appid=c4d43f47ca2c4387e922975a2bf99380';
    http.get(url).then((http.Response response) {
      final val = jsonDecode(response.body);
      final tem = val['main']['temp'];
      temperature = tem.toString();
      print(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'City'),
              onChanged: (String value) {
                setState(() {
                  cityValue = value;
                });
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              child: Text('click', style: TextStyle(color: Colors.white)),
              onPressed: temp,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
