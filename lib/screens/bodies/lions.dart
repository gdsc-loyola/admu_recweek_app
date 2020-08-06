import 'package:flutter/material.dart';

class LionsScreen extends StatefulWidget {
  @override
  _LionsScreenState createState() => _LionsScreenState();
}

class _LionsScreenState extends State<LionsScreen> {
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LIONS",
          style: TextStyle(
              color: const Color(0xffFF801D), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.05,
        iconTheme: new IconThemeData(color: const Color(0xffFF801D)),
        actions: <Widget>[
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
                      ? Image.asset('assets/icons/lions_bookmark_active.png')
                      : Image.asset('assets/icons/lions_bookmark.png'),
                ),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 72.0,
                width: 72.0,
                child: Image.asset('assets/logos/lions.png'),
              ),
            ),
            Text(
              "League of Independent Organizations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
                child: Image.asset('assets/images/placeholder.png'),
                height: 180,
                margin: const EdgeInsets.only(bottom: 8, top: 16)),
            Text(
              "Description of LIONS. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Align(
                  child: Text(
                "Categories",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: () {
                        print("Learn More");
                      },
                      color: const Color(0xffFF801D),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Learn More',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
