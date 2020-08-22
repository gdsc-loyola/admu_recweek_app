// import 'package:admu_recweek_app/models/size-info.dart';
// import 'package:admu_recweek_app/utils/screen-utils.dart';
import 'package:admu_recweek_app/screens/team.dart';
import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  @override
  _ModalState createState() => _ModalState();
}
  class _ModalState extends State<Modal> {
    bool show = false;
    @override
    Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
        child: SizedBox(
          height: 48,
          width: 48,
          child: Image.asset("assets/images/DSCL logo.png"),
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, __, ___) {
              return new Scaffold(
              backgroundColor: Colors.black45,
              body: new Container( 
                height: 200,
                width: 350,
                margin: EdgeInsets.symmetric(
                  horizontal: 50, 
                  vertical: 200
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                alignment: Alignment.center,
                child: Padding (
                  padding: EdgeInsets.all(4.0),
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Image.asset("assets/orgs/dsc/logo.png"),
                      ),
                      Padding (
                        padding: EdgeInsets.all(8.0),
                        child: Text (
                          "Like this mobile app? Want more products like this from DSC Loyola? Feel free to support us below!",
                          style: TextStyle (
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: ButtonTheme(
                                  minWidth: 120.0,
                                  height: 40.0,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {
                                      setState(() => show = !show);
                                    },
                                    color: const Color(0xff1C41B2),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Donate',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    ),
                                  )
                                )
                              ), 
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {
                                    MaterialPageRoute(
                                          builder: (context) =>
                                          ProductTeamScreen()
                                    );
                                },
                                color: const Color(0xffFFFFFF),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Join Us!',
                                    style: TextStyle(
                                    color: const Color(0xff295EFF),
                                      fontSize: 12.0,
                                      fontWeight:FontWeight.bold
                                    )
                                  )
                                )
                              ),
                            ],
                          )
                        )
                      )
                    ]
                  ),
                ),// FlatButton
              ), // Container
              ); // Scaffold
              }
            )
          ); // PageRouteBuilder
        }
      )
    );
    }
  }