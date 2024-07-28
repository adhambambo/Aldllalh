import 'package:eldalala/Screens/Login_Page.dart';
import 'package:eldalala/Screens/contest.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreenfour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return Contest();
    } else {
      return LoginScreen();
    }
  }
}
