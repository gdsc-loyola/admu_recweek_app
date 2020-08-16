import 'package:admu_recweek_app/widgets/base-widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

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
              Container(
                  child: Image.asset('assets/images/placeholder.png'),
                  height: 180,
                  margin: const EdgeInsets.only(bottom: 8, top: 16)),
              Text(
                "Description of LIONS. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
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
                              print("Adventure");
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
                              print("Adventure");
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
                                        "Art",
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
                              print("Business");
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
                              print("Community");
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
                              print("Culture");
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
                              print("Design");
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
                              print("Education");
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
                              print("Environment");
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
                              print("Home Org");
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
                              print("International");
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
                              print("Language");
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
                              print("Lifestyle");
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
                              print("Literature");
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
                              print("Music");
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
                              print("Spiritual");
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
                              print("Technology");
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
                      launch("https://lionshub.org/");
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
