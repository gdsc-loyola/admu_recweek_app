// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:admu_recweek_app/screens/login.dart';
// import 'package:admu_recweek_app/controllers/push_nofitications.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   PushNotificationsManager().init();

//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       builder: DevicePreview.appBuilder,
//       title: 'ADMU Recweek App',
//       theme: ThemeData(
//           fontFamily: 'Nunito',
//           hintColor: Colors.white,
//           backgroundColor: Colors.white),
//       home: LoginScreen(),
//     ),
//   );
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:admu_recweek_app/screens/login.dart';
import 'package:admu_recweek_app/controllers/push_nofitications.dart';
import 'package:admu_recweek_app/widgets/base-widget.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager().init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: 'Pavilion',
      theme: ThemeData(
          fontFamily: 'Nunito',
          hintColor: Colors.white,
          backgroundColor: Colors.white),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: double.infinity,
            width: double.infinity,
            child: Center(child: BaseWidget(builder: (context, sizeInfo) {
              return Column(children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        //width: MediaQuery.of(context).size.height,
                      ),
                      Text(
                        "pavilion",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                            fontSize: 56.0,
                            color: const Color(0xff295EFF)),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
                          child: Text(
                            'Made by:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff787979),
                              fontSize: 12,
                              fontFamily: 'Google Sans',
                            ),
                          ),
                        ),
                      ],
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 24.0),
                      child: Image.asset(
                        'assets/images/dscl_horizontal.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    )),
              ]);
            }))));
  }
}
