import 'package:flutter/material.dart';
import 'package:admu_recweek_app/models/tracker.dart';

class TrackerScreen extends StatefulWidget {
  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  void initState() {
    contentState = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: contentState == 0
                            ? const Color.fromRGBO(41, 94, 255, 0.15)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/icons/saved.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Saved",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xff295EFF),
                                  fontSize: 24.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        contentState = 0;
                      });
                    },
                  ),
                  new GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: contentState == 1
                            ? const Color.fromRGBO(41, 94, 255, 0.15)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/icons/applied.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Applied",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xff295EFF),
                                  fontSize: 24.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        contentState = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: content[contentState],
            )
          ],
        ));
    ;
  }
}
