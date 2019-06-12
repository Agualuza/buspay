import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:  50.0,
                        child: Icon(
                            Icons.directions_bus,
                          color: Colors.lightBlue,
                          size: 70.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0) ,
                      ),
                      Text(
                        "BUS PAY",
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Carregando",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
