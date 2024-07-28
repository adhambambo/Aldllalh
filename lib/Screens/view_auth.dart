import 'package:eldalala/Screens/Home_View.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewMode extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  var email = '';
  var password = '';

  void googleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("لم يتم تسجيل دخول المستخدم.");
        return;
      }

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.to(() => HomeView());
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print(userCredential.user);

      print("تم تسجيل دخول المستخدم بنجاح: ${googleUser.displayName}");
    } catch (error) {
      print("حدث خطأ أثناء تسجيل دخول المستخدم: $error");
    }
  }
}
