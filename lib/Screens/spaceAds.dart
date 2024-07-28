import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceAds extends StatelessWidget {
  const SpaceAds({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الدلالة',
          style: TextStyle(fontFamily: 'Roboto'), // استخدام خط عصري
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // تغيير لون شريط التطبيق
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white, // خلفية بيضاء للصفحة
          borderRadius: BorderRadius.circular(20), // زوايا مستديرة
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // ظلال
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 150.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/100.jpg', //
                    width: 40, //
                    height: 40, //
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'الـدلالـه',
                    style: GoogleFonts.cairo(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Text(
              ' التواصل معنا عن طريق الهاتف والواتس اب لعرض بياناتك في الصفحة الرئيسية ',
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: kPrimaryColor,
              ), // استخدام ألوان متباينة
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // اضف أكواد الاتصال هنا
              },
              child: Text(
                '01207209012',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue), // استخدام ألوان متباينة
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                // اضف أكواد الاتصال هنا
              },
              child: Text(
                '01097666923',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue), // استخدام ألوان متباينة
              ),
            ),
          ],
        ),
      ),
    );
  }
}
