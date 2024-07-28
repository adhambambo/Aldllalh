import 'dart:io';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/maps.dart';
import 'package:eldalala/Screens/payments.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Text_Field.dart';
import 'package:eldalala/Screens/dropButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LocationController extends GetxController {
  var location = ''.obs;
}

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  late File file;
  var imagepicker = ImagePicker();
  List<String> selectedImages = [];
  List<String> selectedImagesNames = [];
  List<String> selectedImagestwo = [];
  List<String> selectedImagesNamestwo = [];
  String? url; // قم بتعريف المتغير هنا
  int selectedImagesCount = 0;
  // start with map
  LatLng? selectedLocation;
  String? url1;
  String? url2;
  String? url3;
  String? url4;
//start add image pic
  List<String> imageUrls = [];

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
          var refstorage =
              FirebaseStorage.instance.ref('images/$documentName/$nameimage');

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

// images two
  // قم بتعريف قائمة لتخزين روابط الصور

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
          var refstorage =
              FirebaseStorage.instance.ref('images/$documentName/$nameimage');

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

// دالة لتحديث حقول Firestore بالروابط الصحيحة
  Future<void> updateFirestoreFields(String? userEmail) async {
    if (userEmail != null) {
      Map<String, dynamic> updateData = {};

      // تحديث الحقول المناسبة في Firebase Firestore بالروابط المناسبة
    for (int i = 0; i < imageUrls.length; i++) {
  updateData['image${i == 0 ? '' : i}'] = imageUrls[i];
}


      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userEmail)
          .update(updateData);
    }
  }

//end
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
    TextEditingController tiktok = TextEditingController();

  User? currentUser;

  @override
  void initState() {
    super.initState();
    // تحميل بيانات المستخدم عند بدء التشغيل
    currentUser = FirebaseAuth.instance.currentUser;
  }

  String? selectedCategory;
  String? selectedSubCategory;
  // String? selectedLocation;

  CollectionReference Users = FirebaseFirestore.instance.collection("Users");
  Future<void> _addDataToFirestore() async {
    try {
      CollectionReference Users =
          FirebaseFirestore.instance.collection('Users');
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
          await Users.doc(userEmail).set({
            "name": name.text != null ? name.text : "",
            "address": address.text != null ? address.text : "",
            "facebook": facebook.text != null ? facebook.text : "",
            "insta": instagram.text != null ? instagram.text : "",
            "tele": telegram.text != null ? telegram.text : "",
            "whats": whatsapp.text != null ? whatsapp.text : "",
            "phone": phone.text != null ? phone.text : "",
            "category": selectedCategory != null ? selectedCategory : "",
            "text": text.text != null ? text.text : "",
            'row': row.text != null ? row.text : "",
                'tiktok': tiktok.text !=null ? tiktok.text : '',
                 'image': selectedImages.isNotEmpty
                ? selectedImages[0]
                : "", // استخدام الصورة الرئيسية فقط
            'image1': selectedImages.length > 1 ? selectedImages[1] : "",
            'image2': selectedImages.length > 2 ? selectedImages[2] : "",
            'image3': selectedImages.length > 3 ? selectedImages[3] : "",
            'image4': selectedImages.length > 4 ? selectedImages[4] : "",
            'image5': selectedImages.length > 5 ? selectedImages[5] : "",
            'image6': selectedImages.length > 6 ? selectedImages[6] : "",
            'image7': selectedImages.length > 7 ? selectedImages[7] : "",
            'image8': selectedImages.length > 8 ? selectedImages[8] : "",
            'image9': selectedImages.length > 9 ? selectedImages[9] : "",
            'image10': selectedImages.length > 10 ? selectedImages[10] : "",
          
          }, SetOptions(merge: true));

          //await _addDataToFirestore(location.text);
          print('تم حفظ البيانات بنجاح!');
          setState(() {});
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
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          'صفحة الاشتراك  ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: formState,
        onChanged: () {
          // يمكنك هنا حفظ القيم في قاعدة البيانات
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            CustomTextFormField(
              text: 'الاسم',
              hint: ' ادخل اسم البراند الخاص بك (اجباري)  ',
              direction: TextDirection.rtl,
              onSaved: (value) {
                name.text = value.toString();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'يجب إدخال الاسم'; // رسالة الخطأ عند عدم إدخال القيمة
                }
                return null;
              },
              prefixIcon: Icon(FontAwesomeIcons.file,color: kPrimaryColor),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              text: 'العنوان',
              hint: ' عنوان المكان الذي تنشره  (اجباري)  ',
              direction: TextDirection.rtl,
              onSaved: (value) {
                address.text = value.toString();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'يجب إدخال العنوان'; // رسالة الخطأ عند عدم إدخال القيمة
                }
                return null;
              },
               prefixIcon: Icon(FontAwesomeIcons.home,color: kPrimaryColor),

            ),
            SizedBox(
              height: 30,
            ),

            CustomTextFormField(
              text: 'الرابط الخاص لحساب الفيسبوك',
              hint: 'رابط الفيسبوك ',
              direction: TextDirection.rtl,
              onSaved: (value) {
                facebook.text = value.toString();
              },
              prefixIcon: Icon(FontAwesomeIcons.facebookF,color: Colors.blue,),

            ),
            SizedBox(
              height: 30,
            ),

            CustomTextFormField(
              text: 'الرابط الخاص لحساب انستجرام',
              hint: 'رابط الانستجرام ',
              direction: TextDirection.rtl,
              onSaved: (value) {
                instagram.text = value.toString();
              },
             prefixIcon: Icon(FontAwesomeIcons.instagram, color: Colors.pink,),

            ),
            SizedBox(
              height: 30,
            ),

            CustomTextFormField(
              text: ' رابط قناة التليجرام',
              hint: 'ادخل رابط قناة التليجرام الخاص بك ',
              direction: TextDirection.rtl,
              onSaved: (value) {
                telegram.text = value.toString();
              },
              prefixIcon: Icon(FontAwesomeIcons.telegram,color: Colors.blue,),
            ),
              CustomTextFormField(
              text: ' رابط حساب التيك توك',
              hint: 'ادخل رابط حساب التيك توك الخاص بك ',
              direction: TextDirection.rtl,
              onSaved: (value) {
              tiktok.text = value.toString();
              },
              prefixIcon: Icon(FontAwesomeIcons.tiktok,color: Colors.pink,),
            ),
            SizedBox(
              height: 30,
            ),

           CustomTextFormField(
  text: 'واتس اب',
  hint: 'ادخل رقم واتس اب متوفر خاص بك  (اجباري)  ',
  direction: TextDirection.rtl,
  onSaved: (value) {
    if (value != null && value.isNotEmpty) {
      // قسم الجزء الأول من النص
      String firstPart = "https://wa.me/+2";
      // قسم الجزء الثالث من النص
      String thirdPart = ":/send/";
      // الرقم الذي تم إدخاله
      String phoneNumber = value;
      // النص النهائي المكون من الأجزاء الثلاثة
      String finalText = "$firstPart$phoneNumber$thirdPart";
      // تخزين النص النهائي في whatsapp.text
      whatsapp.text = finalText;
    }
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'يجب إدخال رقم واتس أب صالح'; // رسالة الخطأ عند عدم إدخال القيمة
    }
    return null;
  },
  prefixIcon: Icon(FontAwesomeIcons.whatsapp,color: Colors.green,),
  keyboardType: TextInputType.phone,
),

            SizedBox(
              height: 30,
            ),

            CustomTextFormField(
              text: 'الهاتف',
              hint: 'ادخل رقم موبايل (اجباري)   ',
              direction: TextDirection.rtl,
              onSaved: (value) {
                phone.text = value.toString();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'يجب إدخال رقم هاتف صالح'; // رسالة الخطأ عند عدم إدخال القيمة
                }
                return null;
              },
              prefixIcon: Icon(FontAwesomeIcons.phone,color: Colors.green,),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 30,
            ),

            CustomTextFormField(
              
              text: 'معلومات عن المشترك',
              hint:
                  'ادخل معلومات عنك وعن الخدمات التي تقدمها',
              direction: TextDirection.rtl,
              onSaved: (value) {
                text.text = value.toString();
              },
              prefixIcon: Icon(FontAwesomeIcons.message ,color: kPrimaryColor),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await uploadImages();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // لون الخلفية
                elevation: 5, // زاوية الظل
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // تحديد شكل الحواف
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 24), // تحديد حجم الزر
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo, // يمكنك تغيير الرمز حسب الرمز الذي تريده
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            // ///////////////////////////////////////////////////////////////
            //image2
            ElevatedButton(
              onPressed: () async {
                // img.text = url!;
                await uploadImages2();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 18, 94, 21), // لون الخلفية
                elevation: 5, // زاوية الظل
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18), // تحديد شكل الحواف
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 24), // تحديد حجم الزر
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo, // يمكنك تغيير الرمز حسب الرمز الذي تريده
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: selectedImagestwo.map((imageNamet) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.photo_album, // يمكنك استخدام أيقونة أخرى
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
            DropButton(
              onCategoryChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
                _validateFields(); // تحقق من صحة الحقول عند تغيير الفئة
              },
              onSubCategoryChanged: (value) {
                setState(() {
                  selectedSubCategory = value;
                });
                _validateFields(); // تحقق من صحة الحقول عند تغيير الفئة الفرعية
              },
            ),
            SizedBox(
              height: 14,
            ),
            TextFormField(
              readOnly: true,
              onSaved: (value) {
                LocationController().location.value = value.toString();
              },
              onTap: () async {
                 addUsers();
                // تحديث هنا: استدعاء صفحة الخريطة واستخدام الدالة التي أضفتها
                var selectedLocation = await Get.to(() => MapSample(
                      onLocationChanged: onLocationChanged,
                    ));
                print(locationController.text);
              },
              decoration: InputDecoration(
                labelText: '(اضافة الموقع من الخريطه ) اللوكيشن',
                hintText: selectedLocation != null
                    ? '${selectedLocation!.latitude}, ${selectedLocation!.longitude}'
                    : ' 37.3656465464,34.546456545 ',
                suffixIcon: Icon(Icons.location_history, color: Colors.green),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // لون الزر
              ),
              onPressed: () {
                if (formState.currentState!.validate()) {
                  formState.currentState!.save(); // احفظ القيم

                  addUsers();

                  Get.to(() => Payment(
                        Paymentdata: {},
                      ));
                }
              },
              child: Text(
                'استكمال البيانات',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ), // لون النص داخل الزر
                textDirection: TextDirection.rtl,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _validateFields() {
    if (selectedCategory == null || selectedSubCategory == null) {
      return; // لا تفعل شيئًا إذا لم يتم اختيار الفئة أو الفئة الفرعية
    }

    if (formState.currentState!.validate()) {
      // تحقق من صحة الـ Form
      setState(() {
        // هنا يمكنك تنفيذ أي إجراءات إضافية إذا كانت الفئة والفئة الفرعية صحيحة
      });
    }
  }
}
