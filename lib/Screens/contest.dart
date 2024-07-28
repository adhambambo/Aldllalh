import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:eldalala/Screens/banners.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contest extends StatefulWidget {
  const Contest({super.key});

  @override
  State<Contest> createState() => _ContestState();
}

class _ContestState extends State<Contest> {
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
      FirebaseFirestore.instance.collection('contest').doc(documentName).set({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('مسابقة الدلاله'),
     centerTitle: true,
     backgroundColor: kPrimaryColor,
     elevation: 0,

    ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             CachedNetworkImage(
               imageUrl: BannerImages.imageUrl5 ?? '',
               width: MediaQuery.of(context).size.width,
               height: 150,
               fit: BoxFit.fill,
               placeholder: (context, url) => CircularProgressIndicator(),
               errorWidget: (context, url, error) => Icon(Icons.error),
             ),
             SizedBox(height: 35,),
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
                prefixIcon: Icon(Icons.person,color: kPrimaryColor,),
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
                labelText: 'اجابتك',
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
                              'تم ارسال الاجابة'),
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
           
          ],
        ),
      ),
    );
  }
}