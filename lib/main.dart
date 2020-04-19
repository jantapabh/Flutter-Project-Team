import 'package:flutter/material.dart';
import 'package:project/auth.dart';
import 'login_page.dart';
import 'auth.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{

  @override

  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Flutter Test',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
       ),
       home: new LoginPage(auth: new Auth());
    );
  }
}