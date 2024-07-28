import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenHome extends StatefulWidget {
  @override
  _SplashScreenHomeState createState() => _SplashScreenHomeState();
}

class _SplashScreenHomeState extends State<SplashScreenHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start animation
    _controller.forward();

    _navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});  // مدة عرض صفحة الـ Splash Screen
    Get.off(HomeView());  // الانتقال إلى الصفحة الرئيسية
  }
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/100.jpg',
                  width: 60,
                  height: 60,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'الـدلالـه',
                  style: GoogleFonts.marhey(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    color:kPrimaryColor
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'أول دليل مجاني في مصر',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(height: 150),
            SpinKitWanderingCubes(
      color: kPrimaryColor,
      size: 52.0,
    ),
          ],
        ),
      ),
    ),
  );
  }
}
