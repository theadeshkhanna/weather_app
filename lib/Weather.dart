import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './Models/Weather.dart';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeatherCreateState();
  }
}

class _WeatherCreateState extends State<Weather> {
  String temperature;
  Weather weather;
  String cityValue;

  Future<Map>temp(String cityValue) async {
    String url = 'http://api.openweathermap.org/data/2.5/weather?q=$cityValue&units=metric&appid=c4d43f47ca2c4387e922975a2bf99380';
      http.Response response = await http.get(url);

      return jsonDecode(response.body);
  }

  Widget updateTempWidget(String cityvalue) {
    return new FutureBuilder(
      future: temp(cityValue),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if(snapshot.hasData) {
          Map content = snapshot.data;
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(content['main']['temp'].toString()),
                )
              ],
            ),
          );
        }
        else {
          return new Container();
        }
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
              height: 20.0,
            ),
            Container(
              child: updateTempWidget(cityValue),
            )
          ],
        ),
      ),
    );
  }
}
