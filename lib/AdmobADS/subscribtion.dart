import 'package:eldalala/AdmobADS/AdMAnager.dart';
import 'package:flutter/material.dart';

class testads extends StatefulWidget {
  const testads({super.key});

  @override
  State<testads> createState() => _testadsState();
}

class _testadsState extends State<testads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              // تبديل قيمة متغير عرض الإعلانات
              AdManager.showAds = !AdManager.showAds;
            });
          },
          child: Text(AdManager.showAds ? 'Hide Ads' : 'Show Ads'),
        ),
      ),
    );
  }
}
