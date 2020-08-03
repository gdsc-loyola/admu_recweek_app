import 'package:admu_recweek_app/screens/list.dart';
import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  static TextEditingController _filter = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/saved_empty.png'),
              padding: const EdgeInsets.only(bottom: 12.0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'You haven’t saved any org!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListScreen(_filter)),
                  );
                  // onGoogleSignIn(context);
                },
                color: const Color(0xff295EFF),
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Find an organization',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold))))
          ],
        ));
  }
}
