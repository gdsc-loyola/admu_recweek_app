import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/screens/orgs/lions/dsc.dart';
import 'package:admu_recweek_app/screens/team.dart';

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
        padding: EdgeInsets.only(top: 48),
        child: Column(children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ClipOval(
                        child: imageUrl == ""
                            ? Image.asset('assets/images/guest.png')
                            : Image.network(imageUrl,
                                width: 100, height: 100, fit: BoxFit.cover)),
                  ),
                  Text(displayName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Container(
                      padding: imageUrl == ""
                          ? EdgeInsets.symmetric(vertical: 8, horizontal: 30)
                          : EdgeInsets.all(8),
                      child: imageUrl == ""
                          ? Text("Welcome to Pavilion!",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16))
                          : SizedBox(
                              height: 40,
                              width: 224,
                              child: FlatButton(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Sign Out',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ))))),
                ],
              )),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      //Padding (
                      //padding: EdgeInsets.only(bottom: 48),
                      /*child:*/
                      //),
                      Container(
                        // margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                        ),
                        width: double.infinity,
                        height: 168,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: const EdgeInsets.only(top: 24.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff295EFF),
                              ),
                              child: Container(
                                  height: 144,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                                "Passionately made by DSC Loyola EB 20-21",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 12.0),
                                                          child: ButtonTheme(
                                                              minWidth: 120.0,
                                                              height: 40.0,
                                                              child: FlatButton(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                            ProductTeamScreen()
                                                                      ),
                                                                    );
                                                                  },
                                                                  color: const Color(
                                                                      0xff1C41B2),
                                                                  child: Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(
                                                                          'Product Team',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.bold)))))),
                                                      ButtonTheme(
                                                        minWidth: 120.0,
                                                        height: 40.0,
                                                        child: FlatButton(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DSCLoyolaScreen()),
                                                              );
                                                            },
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Text(
                                                                    'Join Us!',
                                                                    style: TextStyle(
                                                                        color: const Color(
                                                                            0xff295EFF),
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold)))),
                                                      )
                                                    ])))
                                      ])))),
                      Align(
                          alignment: Alignment.center,
                          child: FlatButton(
                            child: SizedBox(
                            height: 48,
                            width: 48,
                            child: Image.asset("assets/images/DSCL logo.png"),
                          ),
                          onPressed: () {
                          Navigator.of(context).push(
                            // We will now use PageRouteBuilder
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, __, ___) {
                                return new Scaffold(
                                  backgroundColor: Colors.black45,
                                  body: new Container( 
                                    height: MediaQuery.of(context).size.height /4,
                                    width: MediaQuery.of(context).size.width /1.5,
                                     margin: EdgeInsets.symmetric(
                                        horizontal: MediaQuery.of(context).size.width /5, vertical: MediaQuery.of(context).size.height /3.8 ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(width: 1.0, color: const Color(0xff000000)),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding (
                                      padding: EdgeInsets.all(4.0),
                                      child: Column (
                                      children: <Widget> [
                                        SizedBox(
                                          height: 48,
                                          width: 48,
                                          child: Image.asset("assets/images/DSCL logo.png"),
                                        ),
                                        Text (
                                          "Like this mobile app? Want more products like this from DSC Loyola? Feel free to support us below!",
                                          style: TextStyle (
                                            fontWeight: FontWeight.bold,
                                          )
                                        ),
                                        Row (children: <Widget> [
                                          new FlatButton(
                                          child: Text('Donate'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }
                                        ), 
                                        new FlatButton(
                                          child: Text('Join Us!'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }
                                        ), 
                                        ],)
                                        

                                      ]
                                    ),
                                    ),// FlatButton
                                  ), // Container
                                ); // Scaffold
                              }
                            )
                          ); // PageRouteBuilder
                        }
                      )
                    )])
                  ]),
            ),
          )
        ]));
  }
}
