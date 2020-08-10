import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class LIONSOrgTemplateScreen extends StatefulWidget {
  static String _organization;
  static String _orgLogoPNG;
  static String _description;
  static String _advocacy;
  static String _vision;
  static String _mission;
  static String _applicationProcess;
  static String _featured;
  static String _photosForEachEvent;
  static String _tagline;
  static String _orgPhoto;
  static String _benefits;
  static String _flagships;
  static String _departments;
  static String _facebook;
  static String _socMedHandles;

  LIONSOrgTemplateScreen(String organization, String description, String vision,
      String mission, String tagline, String facebook) {
    _organization = organization;
    _description = description;
    _vision = vision;
    _mission = mission;
    _tagline = tagline;
    _facebook = facebook;
  }

  @override
  _LIONSOrgTemplateScreenState createState() => _LIONSOrgTemplateScreenState();
}

class _LIONSOrgTemplateScreenState extends State<LIONSOrgTemplateScreen> {
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LIONSOrgTemplateScreen._organization,
            style: TextStyle(
                color: const Color(0xff295EFF), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0.05,
          iconTheme: new IconThemeData(color: const Color(0xff295EFF)),
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
                                  'assets/icons/org_bookmark_active.png')
                              : Image.asset('assets/icons/org_bookmark.png'),
                        ),
                      ))
                ],
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    child: Image.asset('assets/orgs/dsc/cover.png'),
                    height: 200,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 184,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/orgs/dsc/logo.png'),
                        ),
                        Row(children: <Widget>[
                          // InkWell(
                          //   child: Image.asset('assets/icons/web.png'),
                          //   onTap: () => launch("https://dscadmu.org/"),
                          // ),
                          // InkWell(
                          //   child: Image.asset('assets/icons/ig.png'),
                          //   onTap: () =>
                          //       launch("https://www.instagram.com/dsc.loyola/"),
                          // ),
                          // InkWell(
                          //   child: Image.asset('assets/icons/twitter.png'),
                          //   onTap: () =>
                          //       launch("https://twitter.com/DSCLoyola"),
                          // ),
                          InkWell(
                            child: Image.asset('assets/icons/fb.png'),
                            onTap: () =>
                                launch(LIONSOrgTemplateScreen._facebook),
                          )
                        ])
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Text(
                    LIONSOrgTemplateScreen._organization,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                    LIONSOrgTemplateScreen._tagline,
                    style: TextStyle(fontSize: 16),
                  )),
              // Org Details
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Org Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                    LIONSOrgTemplateScreen._description,
                    style: TextStyle(fontSize: 16),
                  )),
              // Vision
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Vision",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                    LIONSOrgTemplateScreen._vision,
                    style: TextStyle(fontSize: 16),
                  )),
              // Mission
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Mission",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    LIONSOrgTemplateScreen._mission,
                    style: TextStyle(fontSize: 16),
                  )),
              //Events and Projects
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Events and Projects",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              // Event/Project # 1
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/orgs/dsc/csj.png'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Cloud Study Jams",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                    "A series of workshops with topics ranging from Machine Learning, BigQuery, to Kubernetes. These workshops are tailored to fit members’ diverse skill levels and aims to provide them with practical knowledge on Google Cloud Technology.",
                    style: TextStyle(fontSize: 16),
                  )),
              // Event/Project # 2
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/orgs/dsc/tah.png'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Tech at Home",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                    "A student-led online technology seminar series that teaches new technologies, especially Google technologies to a wide and diverse audience.",
                    style: TextStyle(fontSize: 16),
                  )),
              // Event/Project # 3
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/orgs/dsc/hacks.png'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Eagle Hacks",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                    "A week-long series of workshops and seminars, culminating in a two-day hackathon where students can exercise their skills in software development while making an impact on society.",
                    style: TextStyle(fontSize: 16),
                  )),
              //Learn More Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      launch("https://dscadmu.org/");
                    },
                    color: const Color(0xff295EFF),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Learn More',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
