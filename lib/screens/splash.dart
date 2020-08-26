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
        backgroundColor: Colors.white
      ),
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
    Timer(Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen()
        )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
                color: Colors.white,
                // padding: EdgeInsets.symmetric(
                //   vertical: MediaQuery.of(context).size.height * 0.1
                // ),
                child: Center(
                  child: BaseWidget(builder: (context, sizeInfo) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff295EFF)),
                        ),
                        ),
                        
                        Image.asset(
                                'assets/images/logo.png', 
                                //width: MediaQuery.of(context).size.height,
                        ),
                          
                        Column(
                          children: <Widget>[
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
                      ]);
                })));
  }
}
