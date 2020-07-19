import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:admu_recweek_app/screens/home.dart';
import 'package:admu_recweek_app/screens/list.dart';
import 'package:admu_recweek_app/screens/settings.dart';
import 'package:admu_recweek_app/screens/tracker.dart';

import 'package:admu_recweek_app/models/user.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  // ignore: unused_field
  GoogleSignIn _googleSignIn;
  // ignore: unused_field
  FirebaseUser _user;

  MainScreen(FirebaseUser user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;

  var pages = [
    HomeScreen(),
    ListScreen(),
    TrackerScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          imageUrl,
                        ),
                      )),
                ),
                onPressed: () {
                  debugPrint("profile is pressed");
                },
              ),
            )
          ],
          elevation: 0,
        ),
        // appBar: AppBar(
        //     backgroundColor: Colors.white,
        //     iconTheme: IconThemeData(color: Colors.black),
        //     // elevation: 0,
        //     title: Text("ADMU Recweek App"),
        //     automaticallyImplyLeading: false // remove back button
        //     ),
        body: pages[selectedPageIndex],
        // body: Container(
        //     color: Colors.white,
        //     padding: EdgeInsets.all(50),
        //     child: Align(
        //         alignment: Alignment.center,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             ClipOval(
        //                 child: Image.network(_user.photoUrl,
        //                     width: 100, height: 100, fit: BoxFit.cover)),
        //             SizedBox(height: 20),
        //             Text('Welcome,', textAlign: TextAlign.center),
        //             Text(_user.displayName,
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 25)),
        //             SizedBox(height: 20),
        //             FlatButton(
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(20),
        //                 ),
        //                 onPressed: () {
        //                   _googleSignIn.signOut();
        //                   Navigator.pop(context, false);
        //                 },
        //                 color: Colors.redAccent,
        //                 child: Padding(
        //                     padding: EdgeInsets.all(10),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: <Widget>[
        //                         Icon(Icons.exit_to_app, color: Colors.white),
        //                         SizedBox(width: 10),
        //                         Text('Log out of Google',
        //                             style: TextStyle(color: Colors.white))
        //                       ],
        //                     )))
        //           ],
        //         )))
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(
                  Icons.home,
                  color: selectedPageIndex == 0 ? Colors.blue : Colors.blueGrey,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(
                  Icons.search,
                  color: selectedPageIndex == 1 ? Colors.blue : Colors.blueGrey,
                ),
              ),
              BottomNavigationBarItem(
                  title: Text(""),
                  icon: Icon(
                    Icons.assessment,
                    color:
                        selectedPageIndex == 2 ? Colors.blue : Colors.blueGrey,
                  )),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(
                  Icons.settings,
                  color: selectedPageIndex == 3 ? Colors.blue : Colors.blueGrey,
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedPageIndex = index;
              });
            },
            currentIndex: selectedPageIndex));
  }
}
