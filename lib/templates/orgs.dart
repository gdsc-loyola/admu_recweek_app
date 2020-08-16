import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class OrgTemplateScreen extends StatefulWidget {
  static String _name;
  static String _abbreviation;
  static String _tagline;
  static String _website;
  static String _facebook;
  static String _twitter;
  static String _instagram;
  static String _description;
  static String _advocacy;
  static String _core;
  static String _projectTitleOne;
  static String _projectDescOne;
  static String _projectTitleTwo;
  static String _projectDescTwo;
  static String _projectTitleThree;
  static String _projectDescThree;
  static String _vision;
  static String _mission;
  static String _logo;

  OrgTemplateScreen(
      String name,
      String abbreviation,
      String tagline,
      String website,
      String facebook,
      String twitter,
      String instagram,
      String description,
      String advocacy,
      String core,
      String projectTitleOne,
      String projectDescOne,
      String projectTitleTwo,
      String projectDescTwo,
      String projectTitleThree,
      String projectDescThree,
      String vision,
      String mission,
      String logo) {
    _name = name;
    _abbreviation = abbreviation;
    _tagline = tagline;
    _website = website;
    _facebook = facebook;
    _twitter = twitter;
    _instagram = instagram;
    _description = description;
    _advocacy = advocacy;
    _core = core;
    _projectTitleOne = projectTitleOne;
    _projectDescOne = projectDescOne;
    _projectTitleTwo = projectTitleTwo;
    _projectDescTwo = projectDescTwo;
    _projectTitleThree = projectTitleThree;
    _projectDescThree = projectDescThree;
    _vision = vision;
    _mission = mission;
    _logo = logo;
  }

  @override
  _OrgTemplateScreenState createState() => _OrgTemplateScreenState();
}

class _OrgTemplateScreenState extends State<OrgTemplateScreen> {
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            OrgTemplateScreen._abbreviation != ""
                ? OrgTemplateScreen._name
                : OrgTemplateScreen._abbreviation,
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
                          child: Image.asset(OrgTemplateScreen._logo),
                        ),
                        Row(children: <Widget>[
                          OrgTemplateScreen._website != ""
                              ? InkWell(
                                  child: Image.asset('assets/icons/web.png'),
                                  onTap: () =>
                                      launch(OrgTemplateScreen._website),
                                )
                              : SizedBox.shrink(),
                          OrgTemplateScreen._instagram != ""
                              ? InkWell(
                                  child: Image.asset('assets/icons/ig.png'),
                                  onTap: () =>
                                      launch(OrgTemplateScreen._instagram),
                                )
                              : SizedBox.shrink(),
                          OrgTemplateScreen._twitter != ""
                              ? InkWell(
                                  child:
                                      Image.asset('assets/icons/twitter.png'),
                                  onTap: () =>
                                      launch(OrgTemplateScreen._twitter),
                                )
                              : SizedBox.shrink(),
                          OrgTemplateScreen._facebook != ""
                              ? InkWell(
                                  child: Image.asset('assets/icons/fb.png'),
                                  onTap: () =>
                                      launch(OrgTemplateScreen._facebook),
                                )
                              : SizedBox.shrink(),
                        ])
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Text(
                    OrgTemplateScreen._name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              OrgTemplateScreen._tagline != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._tagline,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Org Details
              OrgTemplateScreen._description != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Org Details",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._description != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._description,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Vision
              OrgTemplateScreen._vision != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Vision",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._vision != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._vision,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Mission
              OrgTemplateScreen._mission != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Mission",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._mission != ""
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._mission,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Advocacy
              OrgTemplateScreen._advocacy != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Advocacy",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._advocacy != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._advocacy,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Core Competency
              OrgTemplateScreen._core != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Core Competency",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._core != ""
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._core,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              //Events and Projects
              OrgTemplateScreen._projectTitleOne != "" &&
                      OrgTemplateScreen._projectTitleTwo != "" &&
                      OrgTemplateScreen._projectTitleThree != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Events and Projects",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              // Event/Project # 1
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/orgs/dsc/csj.png'),
              ),
              OrgTemplateScreen._projectTitleOne != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        OrgTemplateScreen._projectTitleOne,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._projectDescOne != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._projectDescOne,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Event/Project # 2
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/orgs/dsc/tah.png'),
              ),
              OrgTemplateScreen._projectTitleTwo != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        OrgTemplateScreen._projectTitleTwo,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._projectDescTwo != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._projectDescTwo,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
              // Event/Project # 3
              Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/orgs/dsc/hacks.png'),
              ),
              OrgTemplateScreen._projectTitleThree != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        OrgTemplateScreen._projectTitleThree,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                  : SizedBox.shrink(),
              OrgTemplateScreen._projectDescThree != ""
                  ? Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Text(
                        OrgTemplateScreen._projectDescThree,
                        style: TextStyle(fontSize: 16),
                      ))
                  : SizedBox.shrink(),
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
