import 'package:eldalala/Models/firebaseAPI.dart';
import 'package:eldalala/Screens/ShplashScreenshome.dart';
import 'package:eldalala/helper/binding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future backgroundMessage(RemoteMessage message) async {
  print('=============');
  print("${message.notification!.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

   try {
  await FirebaseAPI().initNotifications();
} on Exception catch (e) {
print("Error initializing notifications: $e");}
  runApp(const ElDAlala());
}

//
class ElDAlala extends StatefulWidget {
  const ElDAlala({Key? key}) : super(key: key);

  @override
  State<ElDAlala> createState() => _ElDAlalaState();
}

class _ElDAlalaState extends State<ElDAlala> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('======================User is currently signed out!');
      } else {
        print('===========================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      initialBinding: Binding(),
      home: Scaffold(
        body: SplashScreenHome(),
      ),
    );
  }
}
