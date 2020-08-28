import 'dart:convert';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/templates/orgs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:admu_recweek_app/models/orgs.dart';
import 'bodies/coa.dart';
import 'bodies/lions.dart';

// ignore: must_be_immutable
class ListScreen extends StatefulWidget {
  final TextEditingController searchController;
  final ScrollController scrollController;
  // final List<Orgs> orgList;
  // final List<String> strList;
  // final List<Widget> normalList;
  final FirebaseUser user;

  // ListScreen(this.searchController, this.scrollController, this.user,
  //     this.orgList, this.strList, this.normalList);

  ListScreen(this.searchController, this.scrollController, this.user);

  @override
  _ListScreenState createState() =>
      _ListScreenState(searchController, scrollController, user);
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController searchController;
  ScrollController scrollController;
  FirebaseUser user;
  List<Orgs> orgList = [];
  List<String> strList = [];
  List<Widget> normalList = [];
  String sortStatus = 'Alphabetical';
  final firestoreInstance = Firestore.instance;

  _ListScreenState(
    this.searchController,
    this.scrollController,
    this.user,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJSON();
    });

    searchController.addListener(() {
      filterList();
    });

    super.initState();
  }

  filterList() {
    List<Orgs> orgLists = [];
    orgLists.addAll(orgList);
    normalList = [];
    strList = [];

    if (searchController.text.isNotEmpty) {
      orgLists.retainWhere(
        (orgs) => orgs.name.toLowerCase().contains(
              searchController.text.toLowerCase(),
            ),
      );
    }

    orgLists.forEach((org) {
      normalList.add(
        GestureDetector(
          onTap: () {
            if (org.abbreviation == "COA-M") {
              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new COAScreen(user)),
              );
            } else if (org.abbreviation == "LIONS") {
              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new LionsScreen(user)),
              );
            } else {
              return Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new OrgTemplateScreen(
                    user,
                    org.name,
                    org.abbreviation,
                    org.tagline,
                    org.website,
                    org.facebook,
                    org.twitter,
                    org.instagram,
                    org.description,
                    org.advocacy,
                    org.core,
                    org.projectTitleOne,
                    org.projectDescOne,
                    org.projectTitleTwo,
                    org.projectDescTwo,
                    org.projectTitleThree,
                    org.projectDescThree,
                    org.vision,
                    org.mission,
                    org.body,
                    org.logo,
                    org.cover,
                    org.projectImageOne,
                    org.projectImageTwo,
                    org.projectImageThree,
                  ),
                ),
              );
            }
          },
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: imageUrl == ""
                ? null
                : <Widget>[
                    IconSlideAction(
                        iconWidget:
                            Image.asset('assets/icons/list_bookmark.png'),
                        onTap: () {
                          _onBookmark(org.name, org.abbreviation, org.body);
                        },
                        color: const Color(0xff7598FF))
                  ],
            child: ListTile(
              leading: SizedBox(child: Image.asset(org.logo)),
              title: Text(org.name),
              subtitle: Text(org.body,
                  style: TextStyle(
                      fontSize: 12,
                      color: org.body == "COP"
                          ? const Color(0xff002864)
                          : org.body == "Student Groups"
                              ? const Color(0xff1C41B2)
                              : org.body == "LIONS"
                                  ? const Color(0xffFF801D)
                                  : const Color(0xffE84C4C))),
            ),
          ),
        ),
      );
      strList.add(org.name);
    });

    setState(() {
      strList;
      normalList;
      strList;
    });
  }

  loadJSON() async {
    var orgResult;
    String orgs = await rootBundle.loadString('assets/data/orgs.json');
    orgResult = json.decode(orgs.toString());

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

    orgList
        .sort((x, y) => x.name.toLowerCase().compareTo(y.name.toLowerCase()));

    filter();
  }

  filter() {
    List<Orgs> orgs = [];
    normalList = [];

    orgs.addAll(orgList);

    if (searchController.text.isNotEmpty) {
      orgs.retainWhere((org) =>
          org.name.toLowerCase().contains(searchController.text.toLowerCase()));
    }
    orgs.forEach((org) {
      normalList.add(
        GestureDetector(
          onTap: () {
            if (org.abbreviation == "COA-M") {
              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new COAScreen(user)),
              );
            } else if (org.abbreviation == "LIONS") {
              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new LionsScreen(user)),
              );
            } else {
              return Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new OrgTemplateScreen(
                    user,
                    org.name,
                    org.abbreviation,
                    org.tagline,
                    org.website,
                    org.facebook,
                    org.twitter,
                    org.instagram,
                    org.description,
                    org.advocacy,
                    org.core,
                    org.projectTitleOne,
                    org.projectDescOne,
                    org.projectTitleTwo,
                    org.projectDescTwo,
                    org.projectTitleThree,
                    org.projectDescThree,
                    org.vision,
                    org.mission,
                    org.body,
                    org.logo,
                    org.cover,
                    org.projectImageOne,
                    org.projectImageTwo,
                    org.projectImageThree,
                  ),
                ),
              );
            }
          },
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: imageUrl == ""
                ? null
                : <Widget>[
                    IconSlideAction(
                        iconWidget:
                            Image.asset('assets/icons/list_bookmark.png'),
                        onTap: () {
                          _onBookmark(org.name, org.abbreviation, org.body);
                        },
                        color: const Color(0xff7598FF))
                  ],
            child: ListTile(
              leading: SizedBox(child: Image.asset(org.logo)),
              title: Text(org.name),
              subtitle: Text(org.body,
                  style: TextStyle(
                      fontSize: 12,
                      color: org.body == "COP"
                          ? const Color(0xff002864)
                          : org.body == "Student Groups"
                              ? const Color(0xff1C41B2)
                              : org.body == "LIONS"
                                  ? const Color(0xffFF801D)
                                  : const Color(0xffE84C4C))),
            ),
          ),
        ),
      );
      strList.add(org.name);
    });
    setState(() {
      // ignore: unnecessary_statements
      normalList;
    });
  }

  void _onBookmark(name, abbreviation, body) async {
    bool bookmark = false;
    firestoreInstance
        .collection("bookmarks-2020-2021")
        .document('${user.uid}-$name')
        .get()
        .then((value) {
      if (value.data["name"] == name && value.data["bookmark"]) {
        setState(() {
          bookmark = true;
        });
      } else {
        setState(() {
          bookmark = false;
        });
      }
    });
    if (bookmark) {
      firestoreInstance
          .collection("bookmarks-2020-2021")
          .document('${user.uid}-$name')
          .delete()
          .then((_) {
        Fluttertoast.showToast(
            msg: "You have unbookmarked $name",
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
          .document('${user.uid}-$name')
          .setData({
        "id": user.uid,
        "name": name,
        "abbreviation": abbreviation,
        "body": body,
        "bookmark": true,
      }).then((_) {
        Fluttertoast.showToast(
            msg: "You have bookmarked $name",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var currentStr = "";
    return AlphabetListScrollView(
      strList: strList,
      highlightTextStyle: TextStyle(
        color: const Color(0xff295EFF),
      ),
      showPreview: true,
      itemBuilder: (context, index) {
        return normalList[index];
      },
      indexedHeight: (i) {
        return 90;
      },
      keyboardUsage: true,
      headerWidgetList: <AlphabetScrollListHeader>[
        AlphabetScrollListHeader(widgetList: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(sortStatus,
                      style: TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  // InkWell(
                  //     onTap: () {
                  //       showMaterialModalBottomSheet(
                  //         context: context,
                  //         builder: (context, scrollController) =>
                  //             _sortModal(context, scrollController),
                  //       );
                  //     },
                  //     child: Text(
                  //       "Sort",
                  //       style: TextStyle(
                  //           color: const Color(0xff295EFF), fontSize: 16),
                  //     ))
                ],
              ))
        ], icon: Icon(Icons.sort_by_alpha), indexedHeaderHeight: (index) => 90),
      ],
    );
  }

  // Widget _sortModal(BuildContext context, scrollController) {
  //   return Material(
  //       child: SafeArea(
  //     top: false,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         ListTile(
  //           title: Text(
  //             'Alphabetical',
  //             style: TextStyle(
  //                 color: const Color(0xff295EFF),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16),
  //           ),
  //           leading: SizedBox(
  //             child: Image.asset('assets/icons/alphabetical.png'),
  //             height: 40,
  //             width: 40,
  //           ),
  //           onTap: () {
  //             setState(() {
  //               sortStatus = 'Alphabetical';
  //             });
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //         ListTile(
  //           title: Text(
  //             'Org Bodies',
  //             style: TextStyle(
  //                 color: const Color(0xff295EFF),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16),
  //           ),
  //           leading: SizedBox(
  //             child: Image.asset('assets/icons/org-bodies.png'),
  //             height: 40,
  //             width: 40,
  //           ),
  //           onTap: () {
  //             setState(() {
  //               sortStatus = 'Org Bodies';
  //             });
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     ),
  //   ));
  // }
}
