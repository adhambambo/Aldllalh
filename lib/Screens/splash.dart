import 'package:eldalala/Screens/Login_Page.dart';
import 'package:eldalala/Screens/settings/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return UserProfile();
    } else {
      return LoginScreen();
    }
  }
}
