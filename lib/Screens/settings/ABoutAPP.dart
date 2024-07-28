import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معلومات عن التطبيق'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo0.jpg',
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'تطبيق الدلاله هو تطبيق يعمل كدليل تجاري وصناعي داخل جمهوريه مصر العربيه بشكل مبسط ومتخصص فى بعض المجالات الصناعيه والتجاريه الهامه مثل صناعة وتجارة الملابس وصناعة وتجارة الاحذيه ومستلزمات الانتاج ومستحضرات التجميل ومستلزمات البيت العصري وهو يتيح للمستخدم البحث السريع عن النشاط الذي يرغب في الوصول اليه حيث يجد معلومات متنوعه عن هذه النشاط مثل رقم الهاتف والعنوان والموقع الجغرافي وطرق التواصل على منصات التواصل الاجتماعي مثل الفيسبوك والانستجرام والتليجرام ورقم التواصل على الواتس اب مما يسهل عليه الوصول لهذا النشاط والتواصل معه بكل سهوله. كما يتيح التطبيق ان يقوم المستخدم بإضافة بياناته ومعلومات التواصل به على التطبيق ويجعلها متاحه للأخرين مما يوسع دائرة نشاطه التجاري او الصناعي. وكل المعلومات على التطبيق سوف يتم اضافتها عن طريق اصحابها لضمان صحتها ونقوم بتحديثها بصفة دوريه للتأكد من صحتها',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}