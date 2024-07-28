import 'package:eldalala/AdmobADS/AdsInterstitialAd.dart';
import 'package:eldalala/Screens/AllCategory.dart';
import 'package:eldalala/Screens/splashfour.dart';
import 'package:eldalala/Screens/splashthree.dart';
import 'package:eldalala/Screens/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class Navbar extends StatelessWidget {
  const Navbar({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<String> pageNames = ['كل الفئات', 'فيديوهات', 'اشترك مع الدلاله لعرض نشاطك التجاري','مسابقة الدلاله'];

    return Drawer(
      child: Center(
        child: ListView.separated(
          itemCount: pageNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                pageNames[index],
                style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                switch (index) {

                  case 0:
                   Navigator.push(
  context,
  PageTransition(
    type: PageTransitionType.rightToLeft,
    child: CategoriesPage(),
  ),
);

                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>VideoListPage (factoryData: {},)),
                    );
                    break;
                  case 2:
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreenthree()),
                    );
                    break;
                  case 3:
             Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreenfour()),

                    );   
                   break;
                  default:
                    // يمكنك إضافة التعليمات الخاصة بصفحات أخرى هنا
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
              height: 1.0,
            );
          },
        ),
      ),
    );
  }
}