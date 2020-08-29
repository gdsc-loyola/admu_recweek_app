import 'package:admu_recweek_app/models/orgs.dart';
import 'package:admu_recweek_app/screens/bodies/coa.dart';
import 'package:admu_recweek_app/screens/bodies/lions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:admu_recweek_app/templates/orgs.dart';
import 'package:admu_recweek_app/screens/bodies/sanggu.dart';

class GroupsScreen extends StatefulWidget {
  final String _title;
  final String _body;
  final List<Orgs> _orgs;
  final FirebaseUser _user;
  GroupsScreen([this._user, this._title, this._body, this._orgs]);

  @override
  _GroupsScreenState createState() =>
      _GroupsScreenState(_user, _title, _body, _orgs);
}

class _GroupsScreenState extends State<GroupsScreen> {
  FirebaseUser _user;
  String _title;
  String _body;
  bool bookmark = false;
  List<Orgs> _orgs;

  _GroupsScreenState(this._user, this._title, this._body, this._orgs);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(
              color: _body == "COA"
                  ? const Color(0xffE84C4C)
                  : _body == "LIONS"
                      ? const Color(0xffFF801D)
                      : _body == "COP"
                          ? const Color(0xff002864)
                          : const Color(0xff1C41B2),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.05,
        iconTheme: new IconThemeData(
          color: _body == "COA"
              ? const Color(0xffE84C4C)
              : _body == "LIONS"
                  ? const Color(0xffFF801D)
                  : _body == "COP"
                      ? const Color(0xff002864)
                      : const Color(0xff1C41B2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: GridView.builder(
          itemCount: _orgs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            crossAxisSpacing: 32,
            mainAxisSpacing: 24,
          ),
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                if (_orgs[index].name ==
                    "Sanggunian ng mga Mag-aaral ng mga Paaralang Loyola ng Ateneo de Manila") {
                  return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new SangguScreen(_user)));
                } else if (_orgs[index].name ==
                    "League of Independent Organizations") {
                  return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new LionsScreen(_user)));
                } else if (_orgs[index].name ==
                    "Council of Organizations of the Ateneo - Manila") {
                  return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new COAScreen(_user)));
                } else {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new OrgTemplateScreen(
                        _user,
                        _orgs[index].name,
                        _orgs[index].abbreviation,
                        _orgs[index].tagline,
                        _orgs[index].website,
                        _orgs[index].facebook,
                        _orgs[index].twitter,
                        _orgs[index].instagram,
                        _orgs[index].description,
                        _orgs[index].advocacy,
                        _orgs[index].core,
                        _orgs[index].projectImageOne,
                        _orgs[index].projectTitleOne,
                        _orgs[index].projectDescOne,
                        _orgs[index].projectImageTwo,
                        _orgs[index].projectTitleTwo,
                        _orgs[index].projectDescTwo,
                        _orgs[index].projectImageThree,
                        _orgs[index].projectTitleThree,
                        _orgs[index].projectDescThree,
                        _orgs[index].vision,
                        _orgs[index].mission,
                        _orgs[index].body,
                        _orgs[index].logo,
                        _orgs[index].cover,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: const Color(0xffFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: _orgs[index].cover != ""
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                child: Image.asset(
                                  _orgs[index].cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                child: Image.asset(
                                  "assets/bodies/sanggu/cover.png",
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fitHeight,
                                ))),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 8, left: 8.0, right: 8.0),
                          child: Text(
                            _orgs[index].abbreviation,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        _orgs[index].description + "\n",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
