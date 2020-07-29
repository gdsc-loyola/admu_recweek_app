import 'package:flutter/material.dart';

import 'package:admu_recweek_app/screens/login.dart';
import 'package:admu_recweek_app/controllers/push_nofitications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager().init();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADMU Recweek App',
      theme: ThemeData(
        fontFamily: 'Nunito',
        hintColor: Colors.white,
      ),
      home: LoginScreen()));
}
