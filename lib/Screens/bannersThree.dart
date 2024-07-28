// i will end thhis in new update
/*import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Cores/Custom_Text_Field.dart';
import 'package:eldalala/PAYMOP/paymopPayment.dart';
import 'package:eldalala/Screens/PaymentBanners.dart';
import 'package:eldalala/Screens/maps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class LocationController extends GetxController {
  var location = ''.obs;
}

class BannersThree extends StatefulWidget {
  BannersThree({super.key});

  @override
  State<BannersThree> createState() => _BannersThreeState();
}

class _BannersThreeState extends State<BannersThree> {
  late File file;

  var imagepicker = ImagePicker();
  List<String> selectedImages = [];
  List<String> selectedImagesNames = [];
  int selectedImagesCount = 0;
  User? currentUser;
  List<String> imageUrls = [];
  List<String> selectedImagestwo = [];
  List<String> selectedImagesNamestwo = [];
  LatLng? selectedLocation;

  Future<void> updateFirestoreFields(String? userEmail) async {
    if (userEmail != null) {
      Map<String, dynamic> updateData = {};

      // تحديث الحقول المناسبة في Firebase Firestore بالروابط المناسبة
      for (int i = 0; i < imageUrls.length; i++) {
        updateData['image${i + 1}'] = imageUrls[i];
      }

      await FirebaseFirestore.instance
          .collection('UsersBANNERS')
          .doc(userEmail)
          .update(updateData);
    }
  }

  //
  uploadImages() async {
    var imagepicked = await imagepicker.pickImage(source: ImageSource.gallery);
    if (imagepicked != null) {
      file = File(imagepicked.path);
      var nameimage = basename(imagepicked.path);
      print(nameimage);
      setState(() {
        selectedImages.add(nameimage);
        selectedImagesNames.add(nameimage);
        selectedImagesCount = selectedImages.length;
      });
      if (currentUser != null) {
        String? userEmail = currentUser!.email;

        if (userEmail != null && userEmail.isNotEmpty) {
          // Use the email address as the document name
          String documentName = userEmail;
          //start firebase storage
          var refstorage = FirebaseStorage.instance
              .ref('imagesBANNERS/$documentName/$nameimage');

          await refstorage.putFile(file);
          String url =
              await refstorage.getDownloadURL(); // استخدم url المباشرة هنا

          print('url $url');

          // تحديث القائمة لتخزين الروابط
          imageUrls.add(url);

          // تحديث الحقول المناسبة في Firebase Firestore بالروابط المناسبة
          await updateFirestoreFields(userEmail);
        }
      }
    } else {
      print('please choose an image');
    }
  }

/////////////////// image2
  uploadImages2() async {
    var imagepickedtwo =
        await imagepicker.pickImage(source: ImageSource.gallery);
    if (imagepickedtwo != null) {
      file = File(imagepickedtwo.path);
      var nameimage = basename(imagepickedtwo.path);
      print(nameimage);
      setState(() {
        selectedImagestwo.add(nameimage);
        selectedImagesNamestwo.add(nameimage);
        selectedImagesCount = selectedImagestwo.length;
      });
      if (currentUser != null) {
        String? userEmail = currentUser!.email;
        if (userEmail != null && userEmail.isNotEmpty) {
          // Use the email address as the document name
          String documentName = userEmail;
          // Start firebase storage
          var refstorage = FirebaseStorage.instance
              .ref('imagesBANNERS/$documentName/$nameimage');

          await refstorage.putFile(file);
          String url =
              await refstorage.getDownloadURL(); // استخدم url المباشرة هنا

          print('url $url');

          // تحديث القائمة لتخزين الروابط
          imageUrls.add(url);

          // تحديث الحقول المناسبة في Firebase Firestore بالروابط المناسبة
          await updateFirestoreFields(userEmail);
        }
      }
    } else {
      print('please choose an image');
    }
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController facebook = TextEditingController();

  TextEditingController instagram = TextEditingController();

  TextEditingController telegram = TextEditingController();

  TextEditingController whatsapp = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController text = TextEditingController();

  TextEditingController img = TextEditingController();

  TextEditingController row = TextEditingController();

  TextEditingController image1 = TextEditingController();

  TextEditingController image2 = TextEditingController();

  TextEditingController image3 = TextEditingController();

  TextEditingController image4 = TextEditingController();
  void initState() {
    super.initState();
    // تحميل بيانات المستخدم عند بدء التشغيل
    currentUser = FirebaseAuth.instance.currentUser;
  }

  CollectionReference Userss =
      FirebaseFirestore.instance.collection("UsersBANNERS");
  Future<void> _addDataToFirestore() async {
    try {
      CollectionReference Users =
          FirebaseFirestore.instance.collection('UsersBANNERS');
      DocumentReference response = await Users.add({
        // يمكنك إضافة مزيد من الحقول إذا لزم الأمر
      });
      print('تمت إضافة البيانات إلى Firestore بنجاح!');
    } catch (e, stackTrace) {
      print('حدث خطأ أثناء إضافة البيانات إلى Firestore: $e');
      print('StackTrace: $stackTrace');
    }
  }

  addUsers() async {
    print('تم الضغط على الزر');
    if (formState != null && formState.currentState != null) {
      formState.currentState!.save();
    } else {
      print("formState or formState.currentState is null");
    }
    if (formState.currentState!.validate()) {
      try {
        print('جارٍ حفظ البيانات...');

        // استخدام currentUser.email كمعرف للمستند
        String? userEmail = currentUser?.email;

        if (userEmail != null && userEmail.isNotEmpty) {
          // استخدام الدالة set بدلاً من add لتحديث المستند إذا كان موجودًا أو إنشاءه إذا لم يكن
          await Userss.doc(userEmail).set({
            "name": name.text != null ? name.text : "",
            "address": address.text != null ? address.text : "",
            "facebook": facebook.text != null ? facebook.text : "",
            "insta": instagram.text != null ? instagram.text : "",
            "tele": telegram.text != null ? telegram.text : "",
            "whats": whatsapp.text != null ? whatsapp.text : "",
            "phone": phone.text != null ? phone.text : "",

            "text": text.text != null ? text.text : "",
            'row': row.text != null ? row.text : "",
            'location': selectedLocation != null
                ? selectedLocation.toString()
                : "", // تحويل اللوكيشن إلى سلسلة نصية
            'image': selectedImages.isNotEmpty
                ? selectedImages[0]
                : "", // استخدام الصورة الرئيسية فقط
            'image1': selectedImages.length > 1 ? selectedImages[1] : "",
            'image2': selectedImages.length > 2 ? selectedImages[2] : "",
            'image3': selectedImages.length > 3 ? selectedImages[3] : "",
            'image4': selectedImages.length > 4 ? selectedImages[4] : "",
          }, SetOptions(merge: true));

          //await _addDataToFirestore(location.text);
          print('تم حفظ البيانات بنجاح!');
          setState(() {});

          // Add this line to call _addDataToFirestore
          await _addDataToFirestore(); // Call _addDataToFirestore to add data to Firestore
        } else {
          print('User email is null or empty');
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

  void onLocationChanged(LatLng? location) {
    setState(() {
      selectedLocation = location;
    });
  }

  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ضيف بياناتك للاعلان'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'اضافة بياناتك للاعلان في الصفحة الرئيسيه',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
                CustomTextFormField(
                  text: 'الاسم',
                  hint: 'ادخل اسم البراند الخاص بك ',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    name.text = value.toString();
                  },
                ),
                CustomTextFormField(
                  text: 'العنوان',
                  hint: 'عنوان المكان الذي تنشره',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    address.text = value.toString();
                  },
                ),
                CustomTextFormField(
                  text: 'الرابط الخاص لحساب الفيسبوك',
                  hint: 'اكونت ',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    facebook.text = value.toString();
                  },
                ),
                CustomTextFormField(
                  text: 'الرابط الخاص لحساب انستجرام',
                  hint: 'اكونت ',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    instagram.text = value.toString();
                  },
                ),
                CustomTextFormField(
                  text: ' رقم التليجرام',
                  hint: 'ادخل رقم التليجرام الخاص بك ',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    telegram.text = value.toString();
                  },
                  keyboardType: TextInputType.phone,
                ),
                CustomTextFormField(
                  text: 'واتس اب',
                  hint: 'ادخل رقم واتس اب متوفر خاص بك ',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    whatsapp.text = value.toString();
                  },
                  keyboardType: TextInputType.phone,
                ),
                CustomTextFormField(
                  text: 'الهاتف',
                  hint: 'ادخل رقم موبايل لسهولة تواصل العملاء معك ',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    phone.text = value.toString();
                  },
                  keyboardType: TextInputType.phone,
                ),
                CustomTextFormField(
                  text: 'معلومات عن المشترك',
                  hint:
                      'ادخل معلومات عنك وعن الخدمات التي تقدمها لسهولة التواصل معك',
                  direction: TextDirection.rtl,
                  onSaved: (value) {
                    text.text = value.toString();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // img.text = url!;
                    await uploadImages();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // لون الخلفية
                    elevation: 5, // زاوية الظل
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // تحديد شكل الحواف
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24), // تحديد حجم الزر
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons
                            .add_a_photo, // يمكنك تغيير الرمز حسب الرمز الذي تريده
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        ' إضافة لوجو(صورة رئيسية)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // img.text = url!;
                    await uploadImages2();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 94, 21), // لون الخلفية
                    elevation: 5, // زاوية الظل
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(18), // تحديد شكل الحواف
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24), // تحديد حجم الزر
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons
                            .add_a_photo, // يمكنك تغيير الرمز حسب الرمز الذي تريده
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'اضافة صور لمنتجك',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (selectedImagestwo.isNotEmpty)
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
                          children: selectedImagestwo.map((imageNamet) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons
                                        .photo_album, // يمكنك استخدام أيقونة أخرى
                                    color: Colors.blue, // لون الأيقونة
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    imageNamet,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'عدد الصور: ${selectedImagestwo.length}',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                TextFormField(
                  readOnly: true,
                  onSaved: (value) {
                    LocationController().location.value = value.toString();
                  },
                  onTap: () async {
                    // تحديث هنا: استدعاء صفحة الخريطة واستخدام الدالة التي أضفتها
                    var selectedLocation = await Get.to(() => MapSample(
                          onLocationChanged: onLocationChanged,
                        ));
                    print(locationController.text);
                  },
                  decoration: InputDecoration(
                    labelText: 'اللوكيشن',
                    hintText: selectedLocation != null
                        ? '${selectedLocation!.latitude}, ${selectedLocation!.longitude}'
                        : ' لم يتم تحديد الموقع بعد ',
                    suffixIcon: Icon(Icons.check, color: Colors.green),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // لون الزر
                  ),
                  onPressed: () {
                    formState.currentState!.save();
                    addUsers();
                    Get.to(() => paymobpaymentend());
                  },
                  child: Text(
                    'الدخول لصفحة الدفع لتحميل البيانات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ), // لون النص داخل الزر
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/