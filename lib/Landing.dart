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
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
      body: new Container(
        child: Column(
              children: <Widget>[
                new TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                    controller: _textController,
                  ),
                new ListTile(
                  leading: new RaisedButton(
                    child: new Text('Get Weather'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return Weather(city : _textController.text);
                      }));
                    },
                  ),
                )
              
            
          ],
        ),
      )
    );
  }
}