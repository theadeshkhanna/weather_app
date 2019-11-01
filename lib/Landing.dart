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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.overlay),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
              new Container(
                margin: EdgeInsets.only(left: 15),
                width: 380,
                child: new TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                  style: TextStyle(color: Colors.white),
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
