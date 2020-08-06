import 'package:flutter/material.dart';
import 'package:admu_recweek_app/models/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        //Fix alignment, change to column
        child: Align (
            alignment: Alignment.centerLeft,
            child: Column (
                children: <Widget> [
                  Text(
                    'Hey, ${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()}!',
                    textAlign: TextAlign.left,
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize: 24),
                  ),

                  Text(
                    'Ready to experience Org Culture?',
                    textAlign: TextAlign.left,
                    style: TextStyle (fontSize: 16),
                  ),
                  
                ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: 184.0,
                  ),
                  child: ListView (
                    scrollDirection: Axis.horizontal, 
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget> [
                      Container (
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.orange,
                        ),
                        width: 144.0,
                        child: Column(
                          
                          children: <Widget>[
                            Padding (
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/LIONS logo.png"),
                            ),
                            Row (
                              
                              children: <Widget> [
                                
                                Text (
                                  '27',
                                  style: TextStyle (fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                                ),
                                Text (
                                  ' Orgs',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox (width: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        width: 144.0,
                      ),
                      SizedBox (width: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.green,
                        
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        ),
                        width: 144.0,
                      ),
                ])),
              ],
            )));
  }
}
