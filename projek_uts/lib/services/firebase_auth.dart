import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _authservice = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(
      String email, password, BuildContext context) async {
    try {
      UserCredential credential = await _authservice
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      final String errormsg = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errormsg),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<User?> loginWithEmailandPassword(
      String email, password, BuildContext context) async {
    try {
      UserCredential credential = await _authservice.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      final String errormsg = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errormsg),
        backgroundColor: Colors.red,
      ));
    }
  }
}