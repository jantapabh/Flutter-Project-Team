import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/login_page.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus{

  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus _authStatus = AuthStatus.notSignedIn;


  @override
  Widget build(BuildContext context) {

    switch(_authStatus){

      case AuthStatus.notSignedIn:
       return new LoginPage(auth: widget.auth);

      case AuthStatus.signedIn:
      return new Container(
        child: new Text('Welcome')
      );
    }
  }
}
