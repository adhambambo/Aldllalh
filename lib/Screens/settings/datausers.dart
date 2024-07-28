import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class datauser extends StatefulWidget {
  @override
  _datauserState createState() => _datauserState();
}

class _datauserState extends State<datauser> {
  late Map<String, String> _userData;
  late User _currentUser;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _facebookController = TextEditingController();
  TextEditingController _telegramController = TextEditingController();
  TextEditingController _whatsappController = TextEditingController();
  TextEditingController _instagramController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser!;
    _userData = {}; // تعيين القيمة الابتدائية لـ _userData
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بيانات المشترك'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('Users')
            .doc(_currentUser.email)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('حدث خطأ: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text('لا توجد بيانات لهذا المستخدم'),
            );
          }

          // استخدم البيانات المستلمة من Firestore لبناء واجهة المستخدم
          Map<String, dynamic>? userData =
              snapshot.data!.data() as Map<String, dynamic>?;
          if (userData == null) {
            return Center(
              child: Text('لا توجد بيانات لهذا المستخدم'),
            );
          }

          _nameController.text = userData['name'];
          _addressController.text = userData['address'];
          _phoneController.text = userData['phone'];
          _facebookController.text = userData['facebook'];
          _telegramController.text = userData['tele'];
          _whatsappController.text = userData['whats'];
          _instagramController.text = userData['insta'];
          _textController.text = userData['text'];

          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              ListTile(
                title: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'الاسم'),
                  onChanged: (value) {
                    _userData['name'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'العنوان'),
                  onChanged: (value) {
                    _userData['address'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'رقم الهاتف'),
                  onChanged: (value) {
                    _userData['phone'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _facebookController,
                  decoration: InputDecoration(labelText: 'حساب الفيسبوك'),
                  onChanged: (value) {
                    _userData['facebook'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _telegramController,
                  decoration: InputDecoration(labelText: 'رابط التليجرام'),
                  onChanged: (value) {
                    _userData['tele'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _whatsappController,
                  decoration: InputDecoration(labelText: 'رقم الواتس اب'),
                  onChanged: (value) {
                    _userData['whats'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _instagramController,
                  decoration: InputDecoration(labelText: 'حساب الانستجرام'),
                  onChanged: (value) {
                    _userData['insta'] = value;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(labelText: 'معلومات عن المشترك'),
                  onChanged: (value) {
                    _userData['text'] = value;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // تحديث البيانات في Firestore
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(_currentUser.email)
                      .update(_userData);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, // لون النص على الزر
                  elevation: 4, // الارتفاع
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30), // التباعد الداخلي
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // شكل الحواف
                  ),
                ),
                child: Text('حفظ التغييرات'),
              ),
            ],
          );
        },
      ),
    );
  }
}
