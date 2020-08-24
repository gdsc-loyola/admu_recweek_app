import 'dart:async';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:admu_recweek_app/screens/login.dart';
import 'package:admu_recweek_app/controllers/push_nofitications.dart';

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
    Timer(Duration(seconds: 2),
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
      child:Image.asset(
        "assets/images/logo.png",
        width:MediaQuery.of(context).size.height,
        )
    );
  }
}
