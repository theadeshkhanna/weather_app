import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Weather.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.75), BlendMode.overlay),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter),
      ),
      child: Column(
        children: <Widget>[
          new Container(
              margin: EdgeInsets.only(top: 100),
              child: Text('WeatherGo',
                  style: TextStyle(color: Colors.white, fontSize: 40))),
          new Container(
            margin: EdgeInsets.only(top: 135, left: 30, right: 30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.circular(20)),
            child: new Container(
                padding: EdgeInsets.only(left: 10),
                child: new TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  controller: _textController,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          new Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.circular(20)),
            child: new RaisedButton(
              color: Colors.transparent,
              child: new Text(
                'Get Weather',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Weather(city: _textController.text);
                }));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
