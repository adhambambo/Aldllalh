import 'package:eldalala/Cores/custom_button.dart';
import 'package:eldalala/Screens/view_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewMode> {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/logood.jpg',
                    //height: 220,
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.topCenter,
                    //width: 500,
                    //width: double.infinity,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'يجب عليك تسجيل الدخول للمتابعة',
              style: TextStyle(fontSize: 22, color: Colors.black),
            )),
            SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                CustomButtonWithIcon(
                  text: '   Lgin With Google',
                  iconData: FontAwesomeIcons.google,
                  color: Colors.red,
                  texts: '   Lgin With Google',
                  onTap: () async {
                    controller.googleSignInMethod();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
