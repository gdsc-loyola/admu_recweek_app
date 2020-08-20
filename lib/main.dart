import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:admu_recweek_app/screens/login.dart';
import 'package:admu_recweek_app/controllers/push_nofitications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager().init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: 'ADMU Recweek App',
      theme: ThemeData(
          fontFamily: 'Nunito',
          hintColor: Colors.white,
          backgroundColor: Colors.white),
      home: LoginScreen(),
    ),
  );
}
