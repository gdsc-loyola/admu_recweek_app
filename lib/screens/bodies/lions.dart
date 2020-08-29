import 'dart:convert';

import 'package:admu_recweek_app/models/orgs.dart';
import 'package:admu_recweek_app/screens/empty.dart';
import 'package:admu_recweek_app/widgets/base-widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/templates/groups.dart';
import 'package:page_transition/page_transition.dart';

class LionsScreen extends StatefulWidget {
  static FirebaseUser _user;

  // ignore: non_constant_identifier_names
  LionsScreen([FirebaseUser user]) {
    _user = user;
  }

  @override
  _LionsScreenState createState() => _LionsScreenState();
}

class _LionsScreenState extends State<LionsScreen> {
  final firestoreInstance = Firestore.instance;
  bool bookmark = false;
  bool applied = false;
  List<Orgs> orgList = [];
  List<Orgs> adventureList = [];
  List<Orgs> artsList = [];
  List<Orgs> businessList = [];
  List<Orgs> communityList = [];
  List<Orgs> cultureList = [];
  List<Orgs> designList = [];
  List<Orgs> educationList = [];
  List<Orgs> environmentList = [];
  List<Orgs> homeList = [];
  List<Orgs> internationalList = [];
  List<Orgs> languageList = [];
  List<Orgs> lifestyleList = [];
  List<Orgs> literatureList = [];
  List<Orgs> musicList = [];
  List<Orgs> spiritualList = [];
  List<Orgs> technologyList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJSON();
    });
    super.initState();
    if (LionsScreen._user != null) {
      firestoreInstance
          .collection("applied-2020-2021")
          .document('${LionsScreen._user.uid}-LIONS')
          .get()
          .then((value) {
        if (value.data["name"] == "League of Independent Organizations" &&
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
          .document('${LionsScreen._user.uid}-LIONS')
          .get()
          .then((value) {
        if (value.data["name"] == "League of Independent Organizations" &&
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
          msg: "You have applied to LIONS already.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (bookmark) {
      firestoreInstance
          .collection("bookmarks-2020-2021")
          .document('${LionsScreen._user.uid}-LIONS')
          .delete()
          .then((_) {
        Fluttertoast.showToast(
            msg: "You have unbookmarked League of Independent Organizations",
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
          .document('${LionsScreen._user.uid}-LIONS')
          .setData({
        "id": LionsScreen._user.uid,
        "name": "League of Independent Organizations",
        "abbreviation": "LIONS",
        "body": "LIONS",
        "bookmark": true,
      }).then((_) {
        Fluttertoast.showToast(
            msg: "You have bookmarked League of Independent Organizations",
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
    adventureList.addAll(orgList.where((i) => i.cluster.contains("Adventure")));

    artsList.addAll(orgList.where((i) => i.cluster.contains("Arts")));

    businessList.addAll(orgList.where((i) => i.cluster.contains("Business")));

    communityList.addAll(
        orgList.where((i) => i.cluster.contains("Community Development")));

    cultureList.addAll(orgList.where((i) => i.cluster.contains("Culture")));

    designList.addAll(orgList.where((i) => i.cluster.contains("Design")));

    educationList.addAll(orgList.where((i) => i.cluster.contains("Arts")));

    environmentList
        .addAll(orgList.where((i) => i.cluster.contains("Environment")));

    homeList.addAll(orgList.where((i) => i.cluster.contains("Home Org")));

    internationalList
        .addAll(orgList.where((i) => i.cluster.contains("International")));

    languageList.addAll(orgList.where((i) => i.cluster.contains("Language")));

    lifestyleList.addAll(orgList.where((i) => i.cluster.contains("Lifestyle")));

    musicList.addAll(orgList.where((i) => i.cluster.contains("Music")));

    spiritualList.addAll(orgList.where((i) => i.cluster.contains("Spiritual")));

    technologyList
        .addAll(orgList.where((i) => i.cluster.contains("Technology")));
  }

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
                                'assets/bodies/lions/bookmark_active.png')
                            : Image.asset('assets/bodies/lions/bookmark.png'),
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
                  child: Image.asset('assets/bodies/lions/circle.png'),
                ),
              ),
              Text(
                "League of Independent Organizations",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Stack(children: <Widget>[
                Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/orgs/lions/logos/lions.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 180,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 8, top: 12)),
                Container(
                    height: 184,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          //TODO: Add all socmed of LIONS
                          // InkWell(
                          //     child: Image.asset('assets/bodies/lions/website.png'),
                          //     onTap: () => launch(''),
                          // ),
                          // InkWell(
                          //   child: Image.asset('assets/bodies/lions/ig.png'),
                          //   onTap: () => launch(''),
                          // ),
                          InkWell(
                            child: Image.asset('assets/bodies/lions/twit.png'),
                            onTap: () =>
                                launch('https://www.twitter.com/admulions'),
                          ),
                          InkWell(
                            child: Image.asset('assets/bodies/lions/fb.png'),
                            onTap: () =>
                                launch('https://www.facebook.com/admu.lions'),
                          ),
                        ]))
              ]),
              Text(
                "The League of Independent Organizations (LIONS) is the official autonomous government of unaccredited student organizations in Ateneo de Manila University. LIONS believes that Ateneans have the right to organize; to pursue their respective advocacies and passions for a better society. Recognized by the Loyola Schools in 2017, LIONS aims to empower independent organizations by promoting their creative purposes,  representing them in University bodies, and creating a community that fosters inclusivity, excellence, and integrity. With that — LIONS, together with the Office of Student Activities, welcomes students who wish to join an organization or even start one of their own!",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 16.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Table(
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(LionsScreen._user,
                                      "Adventure", "LIONS", adventureList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/adventure.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Adventure",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(LionsScreen._user,
                                      "Arts", "LIONS", artsList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/arts.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Arts",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(LionsScreen._user,
                                      "Business", "LIONS", businessList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/business.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Business",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(
                                      LionsScreen._user,
                                      "Community Development",
                                      "LIONS",
                                      communityList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/community.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Community",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(LionsScreen._user,
                                      "Culture", "LIONS", cultureList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/culture.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Culture",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: new GroupsScreen(LionsScreen._user,
                                        "Design", "LIONS", designList),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/design.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Design",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: new GroupsScreen(LionsScreen._user,
                                        "Education", "LIONS", educationList),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/education.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Education",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: new GroupsScreen(
                                        LionsScreen._user,
                                        "Environment",
                                        "LIONS",
                                        environmentList),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/environment.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Environment",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: new GroupsScreen(LionsScreen._user,
                                        "Home Orgs", "LIONS", homeList),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/home-org.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Home Org",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(
                                      LionsScreen._user,
                                      "International",
                                      "LIONS",
                                      internationalList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/international.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "International",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: new GroupsScreen(LionsScreen._user,
                                      "Language", "LIONS", languageList),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/language.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Language",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: new GroupsScreen(LionsScreen._user,
                                        "Lifestyle", "LIONS", lifestyleList),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/lifestyle.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Lifestyle",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: new GroupsScreen(LionsScreen._user,
                                        "Literature", "LIONS", literatureList),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/literature.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Literature",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: new GroupsScreen(LionsScreen._user,
                                          "Music", "LIONS", musicList)));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/music.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Music",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: new GroupsScreen(
                                          LionsScreen._user,
                                          "Spiritual",
                                          "LIONS",
                                          spiritualList)));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/spiritual.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Spiritual",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: BaseWidget(builder: (context, sizeInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: new GroupsScreen(
                                          LionsScreen._user,
                                          "Technology",
                                          "LIONS",
                                          technologyList)));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                        'assets/bodies/lions/technology.png'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AutoSizeText(
                                        "Technology",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        minFontSize: 10,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
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
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: EmptyScreen()));
                      // launch("https://lionshub.org/");
                    },
                    color: const Color(0xffFF801D),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AutoSizeText('Learn More',
                            minFontSize: 20,
                            maxFontSize: 24,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))),
              )
            ],
          )),
    );
  }
}
