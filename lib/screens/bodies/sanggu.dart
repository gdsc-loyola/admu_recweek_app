import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class SangguScreen extends StatefulWidget {
  @override
  _SangguScreenState createState() => _SangguScreenState();
}

class _SangguScreenState extends State<SangguScreen> {
  bool bookmark = false;
  int state = 0;    
  
  @override
  void initState() {
    state = 0;
    super.initState();
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
                          bookmark = !bookmark;
                        });
                      },
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: bookmark
                            ? Image.asset(
                                'assets/bodies/student-groups/bookmark_active.png'
                              )
                            : Image.asset('assets/bodies/student-groups/bookmark.png'),
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
              Container(
                  child: Image.asset('assets/bodies/sanggu/cover.png'),
                  height: 180,
                  margin: const EdgeInsets.only(bottom: 8, top: 16)),
              Text(
                "Description of Sanggu. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16 ),
                child:Row(
                  children: <Widget>[
                    Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState( () {
                            state = 0;
                          });
                        },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 48,
                              child: Text (
                                "Office of the President",
                                style: TextStyle (
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, 
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2, 
                              ),
                          )
                      ),
                    ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState( () {
                            state = 1;
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width/3,
                            height: 48,
                                child: Text (
                                  "Office of the Vice President",
                                  style: TextStyle (
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,                           
                                ),
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState( () {
                            state = 2;
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width/3,
                            height: 48,
                                child: Text (
                                  "School  \n Sanggu",
                                  style: TextStyle (
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2, 
                                ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row (
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width/3,
                        color: state == 0 ? Color(0xff295EFF) : state == 1 ? Color(0xffE5E5E5) : Color(0xffE5E5E5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width/3,
                        color: state == 0 ? Color(0xffE5E5E5) : state == 1 ? Color(0xff295EFF) : Color(0xffE5E5E5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width/3,
                        color: state == 0 ? Color(0xffE5E5E5) : state == 1 ? Color(0xffE5E5E5) : Color(0xff295EFF),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget> [
                  state == 0 
                   ? Column (
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Row(
                            children: <Widget>[ 
                              Container( 
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Department of This That 1",
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
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Department of This That 1.1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              ),
                            ],
                          ), 
                        ),
                      ]
                    )
                  : state == 1 
                  ? Column (
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Row(
                            children: <Widget>[ 
                              Container( 
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Department of This That 2",
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
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Department of This That 2.1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              ),
                            ],
                          ), 
                        ),
                      ]
                    )
                  : Column (
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Row(
                            children: <Widget>[ 
                              Container( 
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Department of This That 3",
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
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Department of This That 3.1",
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
                                  shape: BoxShape.circle
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Department of This That 3.2",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              ),
                            ],
                          ), 
                        ),
                      ]
                    )
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
          )
        ),
    );
  }
}
