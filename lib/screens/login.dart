import 'package:admu_recweek_app/widgets/base-widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:admu_recweek_app/screens/main.dart';

import 'package:admu_recweek_app/models/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BaseWidget(builder: (context, sizeInfo) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Center(
            child: BaseWidget(builder: (context, sizeInfo) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/logo.png'),
                      Text(
                        "pavilion",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 56.0,
                            color: const Color(0xff295EFF)),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {
                            onGoogleSignIn(context);
                          },
                          color: const Color(0xff295EFF),
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Sign in with Google',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold)))),
                      Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: GestureDetector(
                            child: Text("Continue offline",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0xff1C41B2),
                                    fontSize: 16.0)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                              setState(() {
                                firstName = "Atenean";
                                email = "";
                                imageUrl = "";
                                displayName = "Guest";
                              });
                            },
                          ))
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      );
    });
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

    getCurrentUser(user);
    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen(user, _googleSignIn)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }
}

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool isUserSignedIn = false;

//   @override
//   void initState() {
//     super.initState();

//     checkIfUserIsSignedIn();
//   }

//   void checkIfUserIsSignedIn() async {
//     var userSignedIn = await _googleSignIn.isSignedIn();

//     setState(() {
//       isUserSignedIn = userSignedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             padding: EdgeInsets.all(50),
//             child: Align(
//                 alignment: Alignment.center,
//                 child: FlatButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     onPressed: () {
//                       onGoogleSignIn(context);
//                     },
//                     color: isUserSignedIn ? Colors.green : Colors.blueAccent,
//                     child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(Icons.account_circle, color: Colors.white),
//                             SizedBox(width: 10),
//                             Text(
//                                 isUserSignedIn
//                                     ? 'You\'re logged in with Google'
//                                     : 'Login with Google',
//                                 style: TextStyle(color: Colors.white))
//                           ],
//                         ))))));
//   }

//   Future<FirebaseUser> _handleSignIn() async {
//     FirebaseUser user;
//     bool userSignedIn = await _googleSignIn.isSignedIn();

//     setState(() {
//       isUserSignedIn = userSignedIn;
//     });

//     if (isUserSignedIn) {
//       user = await _auth.currentUser();
//     } else {
//       final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       user = (await _auth.signInWithCredential(credential)).user;
//       userSignedIn = await _googleSignIn.isSignedIn();
//       setState(() {
//         isUserSignedIn = userSignedIn;
//       });
//     }

//     return user;
//   }
// }
