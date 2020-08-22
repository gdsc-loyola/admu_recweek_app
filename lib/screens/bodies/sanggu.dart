import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class SangguScreen extends StatefulWidget {
  static FirebaseUser _user;

  SangguScreen(FirebaseUser user) {
    _user = user;
  }

  @override
  _SangguScreenState createState() => _SangguScreenState();
}

class _SangguScreenState extends State<SangguScreen> {
  final firestoreInstance = Firestore.instance;
  bool bookmark = false;
  int state = 0;

  @override
  void initState() {
    state = 0;
    super.initState();
    firestoreInstance
        .collection("bookmarks-2020-2021")
        .document('${SangguScreen._user.uid}-LIONS')
        .get()
        .then((value) {
      if (value.data["name"] ==
              "Sanggunian ng mga Mag-aaral ng mga Paaralang Loyola ng Ateneo de Manila" &&
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
          .collection("bookmarks-2020-2021")
          .document('${SangguScreen._user.uid}-Sanggu')
          .delete()
          .then((_) {
        Fluttertoast.showToast(
            msg: "You have unbookmarked Sanggu",
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
          .document('${SangguScreen._user.uid}-Sanggu')
          .setData({
        "id": SangguScreen._user.uid,
        "name": "Sanggunian ng mga Mag-aaral ng mga Paaralang Loyola ng Ateneo de Manila",
        "abbreviation": "Sanggu",
        "body": "Student Groups",
        "bookmark": true,
      }).then((_) {
        Fluttertoast.showToast(
            msg: "You have bookmarked Sanggu",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sanggu",
          style: TextStyle(
              color: const Color(0xff1C41B2), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.05,
        iconTheme: new IconThemeData(color: const Color(0xff1C41B2)),
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
                                'assets/bodies/student-groups/bookmark_active.png')
                            : Image.asset(
                                'assets/bodies/student-groups/bookmark.png'),
                      ),
                    ))
              ],
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: ListView(
            primary: false,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 72.0,
                  width: 72.0,
                  child: Image.asset('assets/bodies/sanggu/logo.png'),
                ),
              ),
              Text(
                "Sanggunian ng mga Mag-aaral ng mga Paaralang Loyola ng Ateneo de Manila",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Stack(
                children: <Widget> [
                  Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset('assets/orgs/coa/STUDENT_GROUPS/sanggu_cover.png', fit: BoxFit.cover,),
                      ),
                      height: 180,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 8, top: 12)
                  ),
                  Container(
                    height: 184, 
                    alignment: Alignment.bottomCenter,
                    //padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                            //TODO: Download assets in colour of Sanggu
                            child: Image.asset('assets/icons/web.png'),
                            onTap: () => launch('https://www.oursanggu.com'),
                        ),
                        InkWell(
                          child: Image.asset('assets/icons/twitter.png'),
                          onTap: () => launch('https://www.twitter.com/ADMUSanggu'),
                        ),
                        InkWell(
                          child: Image.asset('assets/icons/fb.png'),
                          onTap: () => launch('https://www.facebook.com/ADMUSanggu'),
                        ),
                      ]
                    ),
                  ),
                ],
              ),

              Text(
                "The LS Sanggunian is the student government of AdMU that aims to listen and provide a voice to each Loyola School student in the hopes to create an empowered community. The Sanggunian aims to build a community wherein individuals are engaged not only in school affairs, but also towards the Philippine nation and the global community.  Aside from these, it hopes to foster leaders with an unconditional type of service through its numerous projects and initiatives including but not limited to the recently concluded MHAW and the annual One Big Pride. Moreover, the different School Sanggunians are all geared towards catering to the different needs of their respective students.",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            state = 0;
                          });
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 48,
                              child: Text(
                                "Office of the President",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            state = 1;
                          });
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 48,
                              child: Text(
                                "Office of the Vice President",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            state = 2;
                          });
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 48,
                              child: Text(
                                "School \n Sanggu",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width / 3,
                        color: state == 0
                            ? Color(0xff295EFF)
                            : state == 1
                                ? Color(0xffE5E5E5)
                                : Color(0xffE5E5E5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width / 3,
                        color: state == 0
                            ? Color(0xffE5E5E5)
                            : state == 1
                                ? Color(0xff295EFF)
                                : Color(0xffE5E5E5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width / 3,
                        color: state == 0
                            ? Color(0xffE5E5E5)
                            : state == 1
                                ? Color(0xffE5E5E5)
                                : Color(0xff295EFF),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  state == 0
                      ? Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      //TODO: Download icons
                                      "Commission on Anti Sexual Misconduct and Violence",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Commission on Gender Equality",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Commission on Mental Health",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16, right: 16),
                                    child: Text(
                                      "Commission on Persons with Special Needs Inclusion",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Commission on Mental Health",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Department of Administrative Affairs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Department of Budget and Management",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Department of Communications",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Department of External Affairs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "Department of Student Welfare and Services",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Presidential Support Team",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])
                      : state == 1
                          ? Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "Central Assembly Secretariat",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "Internals Division",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16,),
                                      child: Text(
                                        "Strategy and Development Division",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                          : Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "SOH Sanggunian",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "JGSOM Sanggunian",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "SOSE Sanggunian",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "SOSS Sanggunian",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      launch("https://oursanggu.com/");
                    },
                    color: const Color(0xff1C41B2),
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
