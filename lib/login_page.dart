import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
   State<StatefulWidget> createState() => new _LoginPageState();

}



class _LoginPageState extends State<LoginPage>{

  String _email;
  String _password;

  @verride
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Login Demo'),
        ),
        body: new Container(child: new Text('Hello World')));
  }
}
