import 'package:flutter/material.dart';
import 'package:admu_recweek_app/models/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(60),
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Welcome! ${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()}! This is the Home Screen',
                    textAlign: TextAlign.center),
              ],
            )));
  }
}
