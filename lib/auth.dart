import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Auth {
  Future<String> signInwithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
}
