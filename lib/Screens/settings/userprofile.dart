import 'package:eldalala/Screens/Home_View.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  UserProfile({
    Key? key,
  }) : super(key: key);
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصي'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(() => HomeView());
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.red,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileInfo(
                'اسم المستخدم', Icons.person, user?.displayName ?? 'لا يوجد'),
            SizedBox(height: 20),
            buildProfileInfo(
                'البريد الإلكتروني', Icons.email, user?.email ?? 'لا يوجد'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfo(String title, IconData icon, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 24,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Divider(
          color: kPrimaryColor,
          thickness: 1,
          height: 20,
        ),
      ],
    );
  }
}
