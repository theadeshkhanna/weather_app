import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Weather extends StatelessWidget {
  final String city;
  Weather({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(city),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[updateTempWidget(city)],
        ));
  }
}

Future<Map> temp(String city) async {
  String url =
      'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=c4d43f47ca2c4387e922975a2bf99380';
  http.Response response = await http.get(url);

  return jsonDecode(response.body);
}

Widget updateTempWidget(String city) {
  return new FutureBuilder(
      future: temp(city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map content = snapshot.data;
          return new Container(
            child: new Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 100),
                            child: Text(
                              content['main']['temp_min'].toString() + '°',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.grey),
                            )),
                        Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              'Min',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 100),
                        child: Text(
                          content['main']['temp'].toString() + '°',
                          style: TextStyle(fontSize: 100),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 100),
                            child: Text(
                              content['main']['temp_max'].toString() + '°',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.grey),
                            )),
                        Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              'Max',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.green,
                )
              ],
            ),
          );
        } else {
          return new Container();
        }
      });
}
