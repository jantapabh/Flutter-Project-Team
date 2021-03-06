import 'package:flutter/material.dart';
import 'package:project/auth.dart';
import 'auth.dart';

//ส่วน Homepage แสดงการ Login และเช็กการเข้าระบบ

class HomePage extends StatelessWidget {

  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;


  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  //ส่วนแสดงผล

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: _signOut)
          ],
        ),
        body: new Container(
          child: new Center(
              child: new Text('Welcome', style: new TextStyle(fontSize: 32.0))),
        ));
  }
}
