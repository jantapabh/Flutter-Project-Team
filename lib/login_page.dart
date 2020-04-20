import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;

  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          print('Register user : $userId');
        }

        widget.onSignedIn();
      } catch (e) {
        print('Error :  $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Center(
           child: Text('SHOP CAT APP', style: new TextStyle(fontSize: 30, color: Colors.black ),)
          ),
        ),
        body: new Container(
            padding: EdgeInsets.all(16.0),
         child: new Column(
           children: <Widget>[
             Image.network("data:image/png;base64,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"),
             new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs() + buildSubmitButtons(),
                )
                )
           ],
            )
                ));
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Sign up', style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text('Sign up', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Have an account ? Login',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
