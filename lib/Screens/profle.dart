import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/settings/ABoutAPP.dart';
import 'package:eldalala/Screens/splash.dart';
import 'package:eldalala/Screens/splashFive.dart';
import 'package:eldalala/Screens/splashtwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاعدادات'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildBox(Icons.person, "      الملف الشخصي", "", () {
              Get.to(() => SplashScreen(),
                transition: Transition.leftToRight, // تحديد نوع الانتقال

              );
            }),
            SizedBox(height: 20),
            buildBox(Icons.mail, "      تواصل معنا", " ", () {
              Get.to(() => SplashScreenfive(),
                transition: Transition.leftToRight);
            }),
            SizedBox(height: 20),
            buildBox(Icons.info, "      عن التطبيق", " ", () {
              Get.to(() => AboutApp(),
                transition: Transition.leftToRight);
            }),
            SizedBox(height: 20),
            buildBox(Icons.verified_user, "      بيانات المشترك ", " ", () {
              Get.to(() => SplashScreentwo(),
                transition: Transition.leftToRight);
            }),
            SizedBox(
              height: 20,
            ),
        // iwill used this i new update 

          /*  ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              onPressed: () {
                Get.to(() => testads());
              },
              icon: (Icon(Icons.ad_units)),
              label: Text(
                'اخفاء الاعلانتا المزعجه',
                style: TextStyle(fontSize: 20),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget buildBox(
      IconData icon, String title, String subTitle, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 10),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
