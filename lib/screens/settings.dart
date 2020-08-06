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
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                    child: Image.network(imageUrl,
                        width: 100, height: 100, fit: BoxFit.cover)),
                SizedBox(height: 20),
                Text(displayName,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 20),
                FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      widget._googleSignIn.signOut();
                      Navigator.pop(context, false);
                    },
                    color: Colors.red[600],
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //Icon(Icons.exit_to_app, color: Colors.white),
                            //SizedBox(width: 10),
                            Text('Sign Out',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold))
                          ],
                        )))
              ],
            )));
  }
}
