import 'package:eldalala/Screens/AddData.dart';
import 'package:eldalala/Screens/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreenthree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return AddData();
    } else {
      return LoginScreen();
    }
  }
}
