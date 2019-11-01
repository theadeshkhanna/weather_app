import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Weather.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var _textController = new TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
                padding: EdgeInsets.only(right: 360),
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 100),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text: 'WeatherGo\n', style: TextStyle(fontSize: 40)),
                    ]
                  ),
                ),
              ),
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
