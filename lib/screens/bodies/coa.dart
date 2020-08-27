import 'package:auto_size_text/auto_size_text.dart';
import 'dart:convert';
import 'package:admu_recweek_app/models/orgs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/templates/groups.dart';

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
  bool applied = false;
  List<Orgs> orgList = [];
  List<Orgs> analysisList = [];
  List<Orgs> faithList = [];
  List<Orgs> techList = [];
  List<Orgs> healthList = [];
  List<Orgs> cultureList = [];
  List<Orgs> creativeList = [];
  List<Orgs> bizList = [];
  List<Orgs> playList = [];
  List<Orgs> sectorList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJSON();
    });
    super.initState();

    if (COAScreen._user != null) {
      firestoreInstance
          .collection("applied-2020-2021")
          .document('${COAScreen._user.uid}-COA')
          .get()
          .then((value) {
        if (value.data["name"] ==
                "Council of Organizations of the Ateneo - Manila" &&
            value.data["applied"]) {
          setState(() {
            applied = true;
          });
        } else {
          setState(() {
            applied = false;
          });
        }
      });
      firestoreInstance
          .collection("bookmarks-2020-2021")
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
  }

  void _onBookmark() async {
    if (applied) {
      Fluttertoast.showToast(
          msg: "You have applied to COA-M already.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (bookmark) {
      firestoreInstance
          .collection("bookmarks-2020-2021")
          .document('${COAScreen._user.uid}-COA')
          .delete()
          .then((_) {
        Fluttertoast.showToast(
            msg:
                "You have unbookmarked Council of Organizations of the Ateneo - Manila",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } else {
      firestoreInstance
          .collection("bookmarks-2020-2021")
          .document('${COAScreen._user.uid}-COA')
          .setData({
        "id": COAScreen._user.uid,
        "name": "Council of Organizations of the Ateneo - Manila",
        "abbreviation": "COA",
        "body": "COA",
        "bookmark": true,
      }).then((_) {
        Fluttertoast.showToast(
            msg:
                "You have bookmarked Council of Organizations of the Ateneo - Manila",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  loadJSON() async {
    var orgResult;
    // Getting the file path of the JSON and Decoding the file into String
    String orgs = await rootBundle.loadString('assets/data/orgs.json');
    orgResult = json.decode(orgs.toString());
    // OUTPUT : [{name: Jan Salvador Sebastian, company: mclinica}, {name: Harvey sison, company: ateneo}, {name: Juan Dela Cruz, company: null universty}]
    // print(jsonResult);
    // We created a loop for adding the `name` and `company` to the USER class
    for (int i = 0; i < orgResult.length; i++) {
      orgList.add(Orgs(
        orgResult[i]['Name'],
        orgResult[i]['Abbreviation'],
        orgResult[i]['Tagline'],
        orgResult[i]['Website'],
        orgResult[i]['Facebook'],
        orgResult[i]['Twitter'],
        orgResult[i]['Instagram'],
        orgResult[i]['Description'],
        orgResult[i]['Advocacy'],
        orgResult[i]['Core'],
        orgResult[i]['Awards'],
        orgResult[i]['projectTitleOne'],
        orgResult[i]['projectDescOne'],
        orgResult[i]['projectTitleTwo'],
        orgResult[i]['projectDescTwo'],
        orgResult[i]['projectTitleThree'],
        orgResult[i]['projectDescThree'],
        orgResult[i]['Vision'],
        orgResult[i]['Mission'],
        orgResult[i]['Body'],
        orgResult[i]['Logo'],
        orgResult[i]['Cluster'],
        orgResult[i]['Cover'],
        orgResult[i]['projectImageOne'],
        orgResult[i]['projectImageTwo'],
        orgResult[i]['projectImageThree'],
      ));
    }
    // Sorting Area
    orgList
        .sort((x, y) => x.name.toLowerCase().compareTo(y.name.toLowerCase()));

    //filter Area
    analysisList.addAll(orgList.where(
        (i) => i.cluster.contains("Analysis and Discourse Cluster (ADC)")));

    faithList.addAll(orgList
        .where((i) => i.cluster.contains("Faith Formation Cluster (FFC)")));

    techList.addAll(orgList.where(
        (i) => i.cluster.contains("Science and Technology Cluster (STC)")));

    healthList.addAll(orgList.where(
        (i) => i.cluster.contains("Health and Environment Cluster (HEC)")));

    cultureList.addAll(orgList.where(
        (i) => i.cluster.contains("Intercultural Relations Cluster (IRC)")));

    creativeList.addAll(orgList.where(
        (i) => i.cluster.contains("Media and Creative Arts Cluster (MCA)")));

    bizList.addAll(
        orgList.where((i) => i.cluster.contains("Business Cluster (BC)")));

    playList.addAll(orgList
        .where((i) => i.cluster.contains("Performing Arts Cluster (PAC)")));

    sectorList.addAll(
        orgList.where((i) => i.cluster.contains("Sector-Based Cluster (SBC)")));
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
                          if (!applied) {
                            bookmark = !bookmark;
                          }
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
              AutoSizeText(
                "Council of Organizations - Ateneo",
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Stack(
                children: <Widget>[
                  Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          'assets/bodies/coa/cover.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 180,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 8, top: 16)),
                  Container(
                      height: 184,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            // InkWell(
                            //     child: Image.asset('assets/icons/website.png'),
                            //     //TODO: Add COA website link
                            //     onTap: () => launch(''),
                            // ),
                            InkWell(
                              child: Image.asset('assets/bodies/coa/ig.png'),
                              onTap: () =>
                                  launch('https://www.instagram.com/coamanila'),
                            ),
                            InkWell(
                              child: Image.asset('assets/bodies/coa/twit.png'),
                              onTap: () =>
                                  launch('https://www.twitter.com/coamanila'),
                            ),
                            InkWell(
                              child: Image.asset('assets/bodies/coa/fb.png'),
                              onTap: () =>
                                  launch('https://www.facebook.com/ateneocoa'),
                            ),
                          ]))
                ],
              ),
              Text(
                "The Council of Organizations of the Ateneo - Manila (COA-M) is the sole, autonomous, confederation of all fifty-six (56) duly-accredited student organizations in the Ateneo de Manila University Loyola Schools. COA-M is united in developing Ateneans to become active, competent, and holistically formed leaders who contribute to nation-building through the Ignatian tradition of service and excellence. COA-M works to promote a vibrant and flourishing organization life in the Ateneo through its roles in being a representative, administrative, formative, collaborative, and unitive body for student organizations in the Loyola Schools.",
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new GroupsScreen(
                                        COAScreen._user,
                                        "Analysis & Discourse",
                                        "COA",
                                        analysisList)),
                              );
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
                                      child: new AutoSizeText(
                                        "Analysis & Discourse",
                                        maxLines: 2,
                                        minFontSize: 15,
                                        maxFontSize: 16,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ],
                              ),
                            ))),
                    TableCell(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new GroupsScreen(
                                      COAScreen._user,
                                      "Faith & Formation",
                                      "COA",
                                      faithList)),
                            );
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
                                    child: new AutoSizeText(
                                      "Faith & Formation",
                                      maxLines: 2,
                                      minFontSize: 15,
                                      maxFontSize: 16,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
                          )),
                    ),
                    TableCell(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new GroupsScreen(
                                      COAScreen._user,
                                      "Science & Technology",
                                      "COA",
                                      techList)),
                            );
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
                                    child: new AutoSizeText(
                                      "Science & Technology",
                                      maxLines: 2,
                                      minFontSize: 15,
                                      maxFontSize: 16,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new GroupsScreen(
                                    COAScreen._user,
                                    "Health & Environment",
                                    "COA",
                                    healthList)),
                          );
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
                                  child: new AutoSizeText(
                                    "Health & Environment",
                                    maxLines: 2,
                                    minFontSize: 15,
                                    maxFontSize: 16,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new GroupsScreen(
                                    COAScreen._user,
                                    "Intercultural Relations",
                                    "COA",
                                    cultureList)),
                          );
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
                                  child: new AutoSizeText(
                                    "Intercultural Relations",
                                    maxLines: 2,
                                    minFontSize: 15,
                                    maxFontSize: 16,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new GroupsScreen(
                                  COAScreen._user,
                                  "Media & the Creative Arts",
                                  "COA",
                                  creativeList)),
                        );
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
                                child: new AutoSizeText(
                                  "Media & the Creative Arts",
                                  maxLines: 2,
                                  minFontSize: 15,
                                  maxFontSize: 16,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new GroupsScreen(
                                  COAScreen._user, "Business", "COA", bizList)),
                        );
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
                                child: new AutoSizeText(
                                  "Business",
                                  maxLines: 2,
                                  minFontSize: 15,
                                  maxFontSize: 16,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )),
                    TableCell(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new GroupsScreen(
                                  COAScreen._user,
                                  "Performing Arts",
                                  "COA",
                                  playList)),
                        );
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
                              child: new AutoSizeText(
                                "Performing Arts",
                                maxLines: 2,
                                minFontSize: 15,
                                maxFontSize: 16,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    TableCell(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new GroupsScreen(
                                    COAScreen._user,
                                    "Sector-Based",
                                    "COA",
                                    sectorList)),
                          );
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
                                  child: new AutoSizeText(
                                    "Sector Based",
                                    maxLines: 2,
                                    minFontSize: 15,
                                    maxFontSize: 16,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
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
                        child: AutoSizeText(
                          'Learn More',
                          minFontSize: 20,
                          maxFontSize: 24,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
              )
            ],
          )),
    );
  }
}
