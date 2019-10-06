import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './landing.dart';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeatherCreateState();
  }
}

class _WeatherCreateState extends State<Weather> {
  String cityValue;
  String temperature;
  //  Map <String, dynamic> val = {};
  // final Map<String, dynamic> things = {};

  String temp() {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityValue&units=metric&appid=c4d43f47ca2c4387e922975a2bf99380';
    http.get(url).then((http.Response response) {
      final Map<String, dynamic> val = jsonDecode(response.body);
      // things = val;
      // final tem = val['main']['temp'];
      // temperature = tem.toString();
      // tafree.add(things.toString());
      print(val);
      return val.toString();
    });
  }

  // String bhasad() {
    
  // }

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
              height: 20.0,
            ),
            RaisedButton(
              child: Text('click', style: TextStyle(color: Colors.white)),
              onPressed: () {
                String to = temp();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return Landing(to);
                }));
              },
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
