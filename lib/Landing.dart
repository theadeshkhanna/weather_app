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
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Drawer'),
              ),
            ],
          ),
        ),
        appBar: AppBar(),
        body: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(left: 15),
                width: 380,
                child: new TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  controller: _textController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new RaisedButton(
                child: new Text('Get Weather'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Weather(city: _textController.text);
                  }));
                },
              ),
            ],
          ),
        ));
  }
}
