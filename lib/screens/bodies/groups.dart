import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admu_recweek_app/models/user.dart';

class COPScreen extends StatefulWidget {
  @override
  _COPScreenState createState() => _COPScreenState();
}

class _COPScreenState extends State<COPScreen> {
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
                                'assets/bodies/cop/bookmark_active.png')
                            : Image.asset('assets/bodies/cop/bookmark.png'),
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
                "Confederation of Publications",
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
                          print ("Heights");
                        },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/cop/heights.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "HEIGHTS Ateneo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "HEIGHTS Ateneo is the official literary and artistic publication of the Ateneo de Manila University. ",
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
                          print ("Guidon");
                        },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/cop/guidon.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "The GUIDON",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "As the official publication of the Ateneo de Manila University, The GUIDON brings forth...",
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
                          print ("Matangalawin");
                        },
                      //child:Card(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/bodies/cop/matanglawin.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Matanglawin Ateneo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          Text(
                            "Mapanghamon ang ating panahon. Kailangan ang mga MATANG nangangahas...",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                      ),
                    //),
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
