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
  String convert(val) {
    var hour =
        new DateTime.fromMillisecondsSinceEpoch(val * 1000).hour.toString();
    var min =
        new DateTime.fromMillisecondsSinceEpoch(val * 1000).minute.toString();
    var sec =
        new DateTime.fromMillisecondsSinceEpoch(val * 1000).second.toString();

    return (hour + ':' + min + ':' + sec);
  }

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
                                  TextStyle(fontSize: 30, color: Colors.grey),
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
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 100),
                        child: Text(
                          content['main']['temp'].toString() + '°',
                          style: TextStyle(fontSize: 75),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 100),
                            child: Text(
                              content['main']['temp_max'].toString() + '°',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey),
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
                ),
                new Card(
                  child: new Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Longitude : '),
                        Text(content['coord']['lon'].toString()),
                        Text('     |     '),
                        Text('Latitude : '),
                        Text(content['coord']['lat'].toString()),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Visibility : '),
                        Text(content['visibility'].toString())
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Wind Speed : '),
                        Text(content['wind']['speed'].toString() + ' m/sec')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Sunrise : '),
                        Text(convert(content['sys']['sunrise'])),
                        Text('     |     '),
                        Text('Sunset : '),
                        Text(convert(content['sys']['sunset'])),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Humidity : '),
                        Text(content['main']['humidity'].toString() + ' %'),
                        Text('     |     '),
                        Text('Pressure : '),
                        Text(content['main']['pressure'].toString() + ' hPa'),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Description : '),
                        Text(content['weather'][0]['description'].toString())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return new Container();
        }
      });
}
