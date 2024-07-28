import 'package:eldalala/Screens/Login_Page.dart';
import 'package:eldalala/Screens/settings/datausers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreentwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return datauser();
    } else {
      return LoginScreen();
    }
  }
}
