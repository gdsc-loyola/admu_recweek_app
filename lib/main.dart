import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:admu_recweek_app/screens/home.dart';
import 'package:admu_recweek_app/screens/list.dart';
import 'package:admu_recweek_app/screens/settings.dart';
import 'package:admu_recweek_app/screens/tracker.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: LoginPageWidget()));

class LoginPageWidget extends StatefulWidget {
  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();

    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      onGoogleSignIn(context);
                    },
                    color: isUserSignedIn ? Colors.green : Colors.blueAccent,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                                isUserSignedIn
                                    ? 'You\'re logged in with Google'
                                    : 'Login with Google',
                                style: TextStyle(color: Colors.white))
                          ],
                        ))))));
  }

  Future<FirebaseUser> _handleSignIn() async {
    FirebaseUser user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoggedInScreen(user, _googleSignIn)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }
}

// ignore: must_be_immutable
class LoggedInScreen extends StatefulWidget {
  GoogleSignIn _googleSignIn;
  FirebaseUser _user;

  LoggedInScreen(FirebaseUser user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  _LoggedInScreenState createState() => new _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
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
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            automaticallyImplyLeading: false // remove back button
            ),
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
