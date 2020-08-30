import 'package:admu_recweek_app/models/orgs.dart';
import 'package:admu_recweek_app/screens/bodies/sanggu.dart';
import 'package:admu_recweek_app/templates/groups.dart';
import 'package:admu_recweek_app/templates/orgs.dart';
import 'package:admu_recweek_app/widgets/base-widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/screens/bodies/coa.dart';
import 'package:admu_recweek_app/screens/bodies/lions.dart';
import 'package:admu_recweek_app/screens/orgs/lions/dsc.dart';
import 'dart:math';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  final List<Orgs> copList;
  final List<Orgs> groupList;
  final List<Orgs> orgList;
  final FirebaseUser user;

  HomeScreen([this.copList, this.groupList, this.orgList, this.user]);

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(copList, groupList, orgList, user);
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseUser user;
  List<Orgs> copList = [];
  List<Orgs> groupList = [];
  List<Orgs> orgList;

  _HomeScreenState(this.copList, this.groupList, this.orgList, this.user);

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber =
        random.nextInt(orgList.length != 0 ? orgList.length : 10);
    return BaseWidget(
      builder: (context, sizeInformation) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          //Fix alignment, change to column
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'Hey, ${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()}!',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'Ready to experience Org Culture?',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 4.5,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8.0),
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: LionsScreen(user),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: const Color(0xFFFF801D),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Stack(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/bodies/lions/logo.png",
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '27',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            ' Orgs',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: COAScreen(user),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Stack(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/bodies/coa/logo.png"),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '56',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ' Orgs',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: GroupsScreen(
                                        user, "COP", "COP", copList),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: const Color(0xFF002864),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Stack(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 4.0,
                                            right: 4.0),
                                        child: Text(
                                          "Confederation of Publications",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/bodies/cop/logos.png",
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              ' Orgs',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: GroupsScreen(user, "Student Groups",
                                      "Student Groups", groupList),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: const Color(0xFF1C41B2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Stack(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 4.0,
                                            right: 4.0),
                                        child: Text(
                                          "Student Groups",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/bodies/student-groups/logos.png",
                                        //fit: BoxFit.fitHeight,
                                        //height: 60,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '7',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            ' Orgs',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8, top: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: AutoSizeText(
                    "Featured Organization",
                    minFontSize: 20,
                    maxFontSize: 24,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
              orgList.length != 0
                  ? GestureDetector(
                      onTap: () {
                        if (orgList[randomNumber].name ==
                            "Sanggunian ng mga Mag-aaral ng mga Paaralang Loyola ng Ateneo de Manila") {
                          return Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: new SangguScreen(user),
                            ),
                          );
                        } else if (orgList[randomNumber].name ==
                            "League of Independent Organizations") {
                          return Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: new LionsScreen(user),
                            ),
                          );
                        } else if (orgList[randomNumber].name ==
                            "Council of Organizations of the Ateneo - Manila") {
                          return Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: new COAScreen(user),
                            ),
                          );
                        } else {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: new OrgTemplateScreen(
                                  user,
                                  orgList[randomNumber].name,
                                  orgList[randomNumber].abbreviation,
                                  orgList[randomNumber].tagline,
                                  orgList[randomNumber].website,
                                  orgList[randomNumber].facebook,
                                  orgList[randomNumber].twitter,
                                  orgList[randomNumber].instagram,
                                  orgList[randomNumber].description,
                                  orgList[randomNumber].advocacy,
                                  orgList[randomNumber].core,
                                  orgList[randomNumber].projectImageOne,
                                  orgList[randomNumber].projectTitleOne,
                                  orgList[randomNumber].projectDescOne,
                                  orgList[randomNumber].projectImageTwo,
                                  orgList[randomNumber].projectTitleTwo,
                                  orgList[randomNumber].projectDescTwo,
                                  orgList[randomNumber].projectImageThree,
                                  orgList[randomNumber].projectTitleThree,
                                  orgList[randomNumber].projectDescThree,
                                  orgList[randomNumber].vision,
                                  orgList[randomNumber].mission,
                                  orgList[randomNumber].body,
                                  orgList[randomNumber].logo,
                                  orgList[randomNumber].cover,
                                ),
                              ));
                        }
                      },
                      child: Stack(children: <Widget>[
                        Image.asset(orgList[randomNumber].cover,
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            fit: BoxFit.cover),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: orgList[randomNumber].body == "LIONS"
                                  ? const Color(0xFFFF801D).withOpacity(0.50)
                                  : orgList[randomNumber].body == "COA"
                                      ? const Color(0xFFE84C4C)
                                          .withOpacity(0.50)
                                      : orgList[randomNumber].body == "COP"
                                          ? const Color(0xFF002864)
                                              .withOpacity(0.50)
                                          : const Color(0xFF295EFF)
                                              .withOpacity(0.50),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    orgList[randomNumber].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: DSCLoyolaScreen(user)));
                      },
                      child: Stack(children: <Widget>[
                        Image.asset("assets/orgs/lions/covers/DSC.jpg",
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            fit: BoxFit.cover),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF801D).withOpacity(0.25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0, top: 8.0, bottom: 8.0),
                                  child: Text(
                                    "Developers Student Clubs - Loyola",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
            ],
          ),
        );
      },
    );
  }
}
