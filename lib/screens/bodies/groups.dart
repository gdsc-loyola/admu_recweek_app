import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class StudentGroupsScreen extends StatefulWidget {
  @override
  _StudentGroupsScreenState createState() => _StudentGroupsScreenState();
}

class _StudentGroupsScreenState extends State<StudentGroupsScreen> {
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Groups",
          style: TextStyle(
            color: const Color(0xff1C41B2), 
            fontWeight: FontWeight.bold
          ),
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
                                'assets/bodies/student-groups/bookmark_active.png')
                            : Image.asset('assets/bodies/student-groups/bookmark.png'),
                      ),
                    ))
              ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Student Groups",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(0.0),
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 24,
                  crossAxisCount: 2,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          print ("Ateneo SJC");
                        },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/ateneoSjc.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Ateneo SJC",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "The Ateneo Student Judicial Court is the official judicial arm of the Sanggunian.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          print ("DSWS");
                        },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/dsws.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "DSWS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "The Department of Student Welfare and Services is the service arm of the Sanggunian.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print ("AEGIS");
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/aegis.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "AEGIS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "Ateneo AEGIS is the Ateneo de Manila University Loyola Schools' official undergraduate...",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print ("OMB");
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/omb.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "OMB",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "The Loyola Schools Office of the Ombudsman is in-charge of facilitating the check and...",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print ("LSOPCS");
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/lsopcs.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "LSOPCS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "LSOPCS is the student arm organization that works with the career advisors of the office.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print ("COMELEC");
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/comelec.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "COMELEC",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "The Ateneo Commission on Elections is an independent body serving as the electoral...",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print ("Sanggu");
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/student-groups/sanggu.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Sanggu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "The LS Sanggunian is the student government of AdMU that aims to listen and provide...",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
