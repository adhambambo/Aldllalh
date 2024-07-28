import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Payment extends StatefulWidget {
  final Map<String, dynamic> Paymentdata;

  Payment({Key? key, required this.Paymentdata}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var imagePicker = ImagePicker();
  String? url;
  late File file;
  List<String> selectedImages = [];
  List<String> selectedImagesNames = [];

  uploadImages() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      file = File(imagePicked.path);
      var imageName = basename(imagePicked.path);
      print(imageName);
      setState(() {
        selectedImages.add(imageName);
        selectedImagesNames.add(imageName);
      });

      if (currentUser != null) {
        String? userEmail = currentUser!.email;

        if (userEmail != null && userEmail.isNotEmpty) {
          String documentName = userEmail;
          var refStorage = FirebaseStorage.instance
              .ref('paymentscash/$documentName/$imageName');

          await refStorage.putFile(file);
          url = await refStorage.getDownloadURL();
          print('URL: $url');

          await FirebaseFirestore.instance
              .collection('linkphotouserpayment')
              .doc(userEmail)
              .update({
            'imageURL': url,
          });
        }
      }
    } else {
      print('Please choose an image');
    }
  }

  User? currentUser;

  bool isAllFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    getDataFromFirestore();
  }

  Future<void> getDataFromFirestore() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('editPayment').get();
      // استخدام البيانات المستردة هنا لتحديث حالة الصفحة
      if (snapshot.docs.isNotEmpty) {
        var Paymentdata = snapshot.docs[0].data() as Map<String, dynamic>;
        // يمكنك استخدام Paymentdata لتحديث الحالة هنا
      } else {
        // لا توجد بيانات
      }
    } catch (error) {
      // تعامل مع الأخطاء هنا
      print('Error fetching data: $error');
    }
  }

  TextEditingController phoneCashController = TextEditingController();
  void _sendDataToFirestore() {
    String phone = phoneCashController.text;

    if (currentUser != null) {
      String? userEmail = currentUser!.email;
      String? documentName = userEmail;

      // إرسال البيانات إلى Firestore
      FirebaseFirestore.instance.collection('cash').doc(documentName).set({
        'email': userEmail,
        'phoneCash': phone,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  String errorMessage = '';

  void _checkFields() {
    String phone = phoneCashController.text;

    setState(() {
      isAllFieldsFilled = phone.isNotEmpty && phone.length == 11;
      errorMessage = 'ادخل رقم الهاتف';
    });
  }

  final Stream<QuerySnapshot> payinfo =
      FirebaseFirestore.instance.collection('editPayment').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اشتراك'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: StreamBuilder(
              stream: payinfo,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  // لا توجد بيانات
                  return Center(
                    child: Text(
                      'No Data Available',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  );
                }
                var Paymentdata =
                    snapshot.data!.docs[0].data() as Map<String, dynamic>;
                if (Paymentdata.containsKey('text')) {}
          
                return Column(
                  children: [
                    Text(
                      'سيتعين عليك دفع مبلغ بقيمة  ',
                      style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      (snapshot.data!.docs[2].data()
                              as Map<String, dynamic>)['paymentamount'] ??
                          ' 200 جنيه سنوياً  ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 107, 34, 34)),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'وسائل الدفع المتاحة عبر جميع المحافظ الالكترونية يمكنك التحويل إلى رقم ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        final String phoneNumber = (snapshot.data!.docs[0].data()
                                as Map<String, dynamic>)['cashnumber'] ??
                            '01097666923';
                        Clipboard.setData(ClipboardData(text: phoneNumber));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'تم نسخ الرقم لتسهيل عملية الدفع: $phoneNumber')));
                      },
                      child: Text(
                        (snapshot.data!.docs[0].data()
                                as Map<String, dynamic>)['cashnumber'] ??
                            '01097666923',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: const Color.fromARGB(255, 107, 34, 34)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'ويمكنك الدفع عن طريق التحويل البنكي عن طريق انستا باي علي رقم ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        final String phoneNumbertwo = (snapshot.data!.docs[0].data()
                                as Map<String, dynamic>)['instapaynumber'] ??
                            '01207209012';
                        Clipboard.setData(ClipboardData(text: phoneNumbertwo));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'تم نسخ الرقم لتسهيل عملية الدفع: $phoneNumbertwo')));
                      },
                      child: Text(
                        (snapshot.data!.docs[1].data()
                                as Map<String, dynamic>)['instapaynumber'] ??
                            '01207209012',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: const Color.fromARGB(255, 107, 34, 34)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: phoneCashController,
                      onChanged: (_) => _checkFields(),
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف الذي تم الدفع من خلاله',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        prefixIcon: Icon(Icons.phone, color: Colors.blue),
                        labelStyle: TextStyle(fontSize: 14),
                        hintTextDirection: TextDirection.rtl,
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                    Text(
                       (snapshot.data!.docs[3].data()
                                as Map<String, dynamic>)['text'] ??
                            ' ',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        uploadImages();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 70, 0, 150),
                        padding: EdgeInsets.all(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image, // استبدل هذا بالرمز الذي ترغب في استخدامه
                            size: 24, // حجم الأيقونة
                          ),
                          SizedBox(width: 8.0), // المسافة بين النص والأيقونة
                          Text('اضافة اسكرين تأكيد الدفع'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    if (url != null)
                      Container(
                        width: 80.0, // تحديد عرض الحاوية
                        height: 80.0, // تحديد ارتفاع الحاوية
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // لون خلفية الحاوية
                          borderRadius:
                              BorderRadius.circular(40.0), // تحديد زوايا الحاوية
                        ),
                        child: CircleAvatar(
                          radius: 35.0, // نصف قطر الدائرة
                          backgroundImage: FileImage(file), // صورة الخلفية
                        ),
                      ),
                    if (selectedImages.isNotEmpty)
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.grey[200], // لون خلفية الحاوية
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الصور المحددة:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Column(
                              children: selectedImages.map((imageName) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.image, // يمكنك استخدام أيقونة أخرى
                                        color: Colors.blue, // لون الأيقونة
                                        size: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        imageName,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'عدد الصور: ${selectedImages.length}',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ElevatedButton(
                      onPressed: isAllFieldsFilled
                          ? () {
                              _sendDataToFirestore();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم الارسال وسيتم عرض صفحتك خلال 24 ساعه وسيتم التواصل معك اذا لزم الأمر',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  duration: Duration(seconds: 4),
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
                  ],
                );
              }),
        ),
      ),
    );
  }
}
