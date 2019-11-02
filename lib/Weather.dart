import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:weather_app/Landing.dart';

class Weather extends StatelessWidget {
  final String city;
  Weather({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg1.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.overlay),
              ),
            ),
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(content['name'].toString(),
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 50),
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
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          content['main']['temp'].toString() + '°',
                          style: TextStyle(fontSize: 75, color: Colors.white),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 50),
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
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                  color: Colors.white,
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Longitude : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['coord']['lon'].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('     |     ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('Latitude : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['coord']['lat'].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Visibility : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['visibility'].toString() + ' m',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Wind Speed : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['wind']['speed'].toString() + ' m/sec',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sunrise : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(convert(content['sys']['sunrise']),
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('     |     ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('Sunset : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(convert(content['sys']['sunset']),
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Humidity : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['main']['humidity'].toString() + ' %',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('     |     ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('Pressure : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['main']['pressure'].toString() + ' hPa',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Description : ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(content['weather'][0]['description'].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.white,
                ),
                new Container(
                  width: 200,
                  margin: EdgeInsets.only(top: 14.9, bottom: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: <Widget>[
                      new RaisedButton(
                        child: Text(
                          'Check Another',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        color: Colors.transparent,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Landing();
                        })),
                      ),
                      new Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          child: Icon(Icons.arrow_forward,
                              color: Colors.black, size: 40),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return new Container();
        }
      });
}
