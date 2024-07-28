import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // استيراد حزمة url_launcher

class FirebaseAPI extends StatelessWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    try {
      // اشتراك جميع المستخدمين في الموضوع 'all_users'
      await _firebaseMessaging.subscribeToTopic('all_users');
      print('تم اشتراك جميع المستخدمين في الموضوع بنجاح!');
    } catch (e) {
      print('حدث خطأ أثناء الاشتراك في الموضوع: $e');
    }

    // تكوين معالج للإشعارات
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // تحقق مما إذا كان هناك بيانات إضافية مع الإشعار
      if (message.data['link'] != null) {
        String link =
            message.data['link']; // الحصول على الرابط من بيانات الإشعار
        String clickAction = message.data['click_action'];
        if (clickAction == 'FLUTTER_NOTIFICATION_CLICK') {
          // فتح الرابط عند النقر على الإشعار
          launchURL(link);
        }
        // فتح الرابط عند النقر على الإشعار
      }
    });
  }

  // دالة لفتح الرابط
  void launchURL(String link) async {
    final String url = link;
    try {
      await launch(url);
    } catch (e) {
      print("Error launching : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
