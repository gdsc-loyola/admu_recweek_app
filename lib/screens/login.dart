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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              OutlineButton(
                splashColor: Colors.grey,
                onPressed: () {
                  onGoogleSignIn(context);
                  // signInWithGoogle().whenComplete(() {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return MainScreen();
                  //       },
                  //     ),
                  //   );
                  // });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                color: isUserSignedIn ? Colors.green : Colors.white,
                borderSide: BorderSide(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/images/google.png"),
                          height: 35.0),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Sign in with Google",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20))
                          // Text(
                          //   'Sign in with Google',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                          )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
