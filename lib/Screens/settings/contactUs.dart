import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  User? currentUser;

  bool isAllFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    // تحميل بيانات المستخدم عند بدء التشغيل
    currentUser = FirebaseAuth.instance.currentUser;
  }

  String errorMessage = '';

  void _checkFields() {
    String userName = nameController.text;
    String message = messageController.text;
    String phone = phoneNumberController.text;

    setState(() {
      isAllFieldsFilled =
          userName.isNotEmpty && message.isNotEmpty && phone.isNotEmpty;
      errorMessage = '';
    });
  }

  void _sendDataToFirestore() {
    String userName = nameController.text;
    String message = messageController.text;
    String phone = phoneNumberController.text;

    if (currentUser != null) {
      String? userEmail = currentUser!.email;
      String? documentName = userEmail;

      // إرسال البيانات إلى Firestore
      FirebaseFirestore.instance.collection('messages').doc(documentName).set({
        'name': userName,
        'message': message,
        'email': userEmail,
        'phoneNumber': phone,
        'timestamp': FieldValue.serverTimestamp(),
      });
      // إعادة تعيين حقول الإدخال بعد الإرسال
      nameController.clear();
      messageController.clear();
      phoneNumberController.clear();
    }
  }
    final String phoneNumberwhatsapp = '201207209012';

  void _launchWhatsApp(String phone) async {
    final url = 'https://wa.me/$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة التواصل'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                 TextField(
              controller: nameController,
              onChanged: (_) => _checkFields(),
              decoration: InputDecoration(
                labelText: 'اسم المستخدم',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                prefixIcon: Icon(Icons.person,color: kPrimaryColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    nameController.clear();
                  },
                ),
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.0),
           TextField(
              controller: phoneNumberController,
              onChanged: (_) => _checkFields(),
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                prefixIcon: Icon(Icons.phone,color: kPrimaryColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    phoneNumberController.clear();
                  },
                ),
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: messageController,
              onChanged: (_) => _checkFields(),
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'رسالتك',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                prefixIcon: Icon(Icons.message,color: kPrimaryColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    messageController.clear();
                  },
                ),
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: isAllFieldsFilled
                  ? () {
                      _sendDataToFirestore();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'تم الارسال وسيتم التواصل معك اذا لزم الأمر'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      Get.to(() => HomeView());
                    }
                  : null,
              child: Text('ارسال'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 70, 0, 150),
                padding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ' او تواصل معنا عن طريق الواتس اب',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
        onPressed: () => _launchWhatsApp(phoneNumberwhatsapp),
        icon: Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.white,
        ),
        label: Text(
          'Whatsapp',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF25D366), // لون واتساب الأخضر
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    

            SizedBox(
              height: 10,
            ),
            /*Center(
              child: Text(
                '01097666923',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 107, 34, 34),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
