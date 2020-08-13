import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class COPScreen extends StatefulWidget {
  @override
  _COPScreenState createState() => _COPScreenState();
}

class _COPScreenState extends State<COPScreen> {
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COP",
          style: TextStyle(
              color: const Color(0xff002864), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.05,
        iconTheme: new IconThemeData(color: const Color(0xff002864)),
        actions: imageUrl == ""
            ? null
            : <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          bookmark = !bookmark;
                        });
                      },
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: bookmark
                            ? Image.asset(
                                'assets/bodies/cop/bookmark_active.png')
                            : Image.asset('assets/bodies/cop/bookmark.png'),
                      ),
                    ))
              ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align (
              alignment: Alignment.center,
              child: Text(
                "Confederation of Publications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.count(
                  primary: false,
                  //padding: const EdgeInsets.all(20.0),
                  //crossAxisSpacing: 12,
                  //mainAxisSpacing: 12,
                  crossAxisCount: 2,
                  children: <Widget> [
                    Container (
                      width: double.infinity,
                      child: Column (
                        children: <Widget> [
                          Container (
                            child: Column (
                              children: <Widget> [
                                Image.asset (
                                  ""
                                ),
                                Text (
                                  "HEIGHTS Ateneo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text (
                                  "HEIGHTS Ateneo is the official literary and artistic publication of the Ateneo de Manila University. ",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
