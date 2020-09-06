import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "",
          ),
          backgroundColor: Colors.white,
          elevation: 0.05,
          iconTheme: new IconThemeData(color: const Color(0xff295EFF)),
        ),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Oh no! The website isn't out yet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff295EFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Image.asset('assets/images/maintenance.png')),
                  Text("Stay tuned!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff295EFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                ])));
  }
}
