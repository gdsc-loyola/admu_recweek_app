import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:admu_recweek_app/models/user.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  GoogleSignIn _googleSignIn;

  SettingsScreen(GoogleSignIn signIn) {
    _googleSignIn = signIn;
  }

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(50),
        child: Column (
            children: <Widget> [
              Align (
                alignment: Alignment.center,
              child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                    child: Image.network(imageUrl,
                        width: 100, height: 100, fit: BoxFit.cover)),
                SizedBox(height: 20),
                Text( displayName,
                    textAlign: TextAlign.center,
                    
                    style:
                        TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                Padding (padding: EdgeInsets.all(8),),
                SizedBox (
                  height: 40,
                  width: 224,
                  child: FlatButton (
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), 
                      ),
                      onPressed: () {
                        widget._googleSignIn.signOut();
                        Navigator.pop(context, false);
                      },
                      color: const Color(0xffCD0000),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Sign Out',
                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold))
                            ],
                        ))))
              ],
            )),
            Expanded (
              child: Align (
                alignment: FractionalOffset.bottomCenter,
                
                child: 
                //   Column (
                //   children: <Widget>[
                    
                //   ],
                // )
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget> [
                          Container (
                            margin: const EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  width: double.infinity,
                                  height: 144,
                          )
                        ]
                    )
                ),
                //],
              )
            )
            ]
            ));
  }
}
