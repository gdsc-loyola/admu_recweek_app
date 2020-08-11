import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class COAScreen extends StatefulWidget {
  static FirebaseUser _user;

  // ignore: non_constant_identifier_names
  COAScreen([FirebaseUser user]) {
    _user = user;
  }

  @override
  _COAScreenState createState() => _COAScreenState();
}

class _COAScreenState extends State<COAScreen> {
  final firestoreInstance = Firestore.instance;
  bool bookmark = false;

  @override
  void initState() {
    super.initState();
    firestoreInstance
        .collection("bookmarks-2019")
        .document('${COAScreen._user.uid}-COA')
        .get()
        .then((value) {
      if (value.data["name"] ==
              "Council of Organizations of the Ateneo - Manila" &&
          value.data["bookmark"]) {
        setState(() {
          bookmark = true;
        });
      } else {
        setState(() {
          bookmark = false;
        });
      }
    });
  }

  void _onBookmark() async {
    if (bookmark) {
      firestoreInstance
          .collection("bookmarks-2019")
          .document('${COAScreen._user.uid}-COA')
          .delete()
          .then((_) {
        print("success!");
      });
    } else {
      firestoreInstance
          .collection("bookmarks-2019")
          .document('${COAScreen._user.uid}-COA')
          .setData({
        "name": "Council of Organizations of the Ateneo - Manila",
        "abbreviation": "COA",
        "body": "COA",
        "bookmark": true,
      }).then((_) {
        print("success!");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COA",
          style: TextStyle(
              color: const Color(0xffE84C4C), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.05,
        iconTheme: new IconThemeData(color: const Color(0xffE84C4C)),
        actions: imageUrl == ""
            ? null
            : <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _onBookmark();
                          bookmark = !bookmark;
                        });
                      },
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: bookmark
                            ? Image.asset(
                                'assets/bodies/coa/bookmark_active.png')
                            : !bookmark
                                ? Image.asset('assets/bodies/coa/bookmark.png')
                                : null,
                      ),
                    ))
              ],
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 72.0,
                  width: 72.0,
                  child: Image.asset('assets/bodies/coa/logo.png'),
                ),
              ),
              Text(
                "Council of Organizations - Ateneo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                  child: Image.asset('assets/bodies/coa/cover.png'),
                  height: 180,
                  margin: const EdgeInsets.only(bottom: 8, top: 16)),
              Text(
                "Description of COA. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 16.0),
                child: Text(
                  "Clusters",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Table(
                children: [
                  TableRow(children: [
                    TableCell(
                        child: GestureDetector(
                            onTap: () {
                              print("Analysis & Discourse");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 64,
                                    width: 64,
                                    child: Image.asset(
                                        'assets/bodies/coa/analysis-discourse.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: new Text(
                                        "Analysis & Discourse",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ))),
                    TableCell(
                      child: GestureDetector(
                          onTap: () {
                            print("Faith & Formation");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 64,
                                  width: 64,
                                  child: Image.asset(
                                      'assets/bodies/coa/faith-formation.png'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: new Text(
                                      "Faith & Formation",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ))
                              ],
                            ),
                          )),
                    ),
                    TableCell(
                      child: GestureDetector(
                          onTap: () {
                            print("Science & Technology");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 64,
                                  width: 64,
                                  child: Image.asset(
                                      'assets/bodies/coa/science-technology.png'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: new Text(
                                      "Science & Technology",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ))
                              ],
                            ),
                          )),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: GestureDetector(
                        onTap: () {
                          print("Health & Environment");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 64,
                                width: 64,
                                child: Image.asset(
                                    'assets/bodies/coa/health-environment.png'),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: new Text(
                                    "Health & Environment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: GestureDetector(
                        onTap: () {
                          print("Intercultural Relations");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 64,
                                width: 64,
                                child: Image.asset(
                                    'assets/bodies/coa/intercultural-relations.png'),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: new Text(
                                    "Intercultural Relations",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                        child: GestureDetector(
                      onTap: () {
                        print("Media & the Creative Arts");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 64,
                              width: 64,
                              child: Image.asset(
                                  'assets/bodies/coa/media-arts.png'),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: new Text(
                                  "Culture",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ))
                          ],
                        ),
                      ),
                    )),
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: GestureDetector(
                      onTap: () {
                        print("Business");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 64,
                              width: 64,
                              child:
                                  Image.asset('assets/bodies/coa/business.png'),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: new Text(
                                  "Business",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ))
                          ],
                        ),
                      ),
                    )),
                    TableCell(
                        child: GestureDetector(
                      onTap: () {
                        print("Performing Arts");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 64,
                              width: 64,
                              child: Image.asset(
                                  'assets/bodies/coa/performing-arts.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: new Text(
                                "Performing Arts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    TableCell(
                      child: GestureDetector(
                        onTap: () {
                          print("Sector Based");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 64,
                                width: 64,
                                child: Image.asset(
                                    'assets/bodies/coa/sector-based.png'),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: new Text(
                                    "Sector Based",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      launch("https://lionshub.org/");
                    },
                    color: const Color(0xffE84C4C),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Learn More',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold)))),
              )
            ],
          )),
    );
  }
}
