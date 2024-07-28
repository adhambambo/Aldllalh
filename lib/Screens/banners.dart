import 'package:eldalala/Screens/profle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerImages {
  static String? imageUrl1;
  static String? imageUrl1plus;
  static String? imageUrl2;
  static String? imageUrl3;
  static String? imageUrl4;
  static String? imageUrl5;

}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: banner(),
    );
  }

  @override
  void initState() {
    super.initState();
    // استرجاع البيانات عند بدء التحميل
    fetchData();
  }

  void fetchData() {
    firestore.collection('banners').snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs[0];
        setState(() {
          BannerImages.imageUrl1 = doc['banner1'];
          BannerImages.imageUrl1plus = doc['banner1plus'];
          BannerImages.imageUrl2 = doc['banner2'];
          BannerImages.imageUrl3 = doc['banner3'];
          BannerImages.imageUrl4 = doc['banner4'];
          BannerImages.imageUrl5 = doc['banner5'];

        });
      }
    });
  }
}

class banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (BannerImages.imageUrl1 != null)
          GestureDetector(
            onTap: () {
              Get.to(() => Profile());
            },
            child: Image.network(
              BannerImages.imageUrl1!,
              width: MediaQuery.of(context).size.width,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
        SizedBox(height: 8),
          if (BannerImages.imageUrl1plus != null)
          GestureDetector(
            onTap: () {
              Get.to(() => Profile());
            },
            child: Image.network(
              BannerImages.imageUrl1plus!,
              width: MediaQuery.of(context).size.width,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
        SizedBox(height: 8),
        if (BannerImages.imageUrl2 != null)
          Image.network(
            BannerImages.imageUrl2!,
            width: MediaQuery.of(context).size.width,
            height: 160,
            fit: BoxFit.cover,
          ),
        SizedBox(height: 8),
        if (BannerImages.imageUrl3 != null)
          Image.network(
            BannerImages.imageUrl3!,
            width: MediaQuery.of(context).size.width,
            height: 160,
            fit: BoxFit.cover,
          ),
        SizedBox(height: 8),
        if (BannerImages.imageUrl4 != null)
          Image.network(
            BannerImages.imageUrl4!,
            width: MediaQuery.of(context).size.width,
            height: 160,
            fit: BoxFit.cover,
          ),
          if (BannerImages.imageUrl5 != null)
          Image.network(
            BannerImages.imageUrl5!,
            width: MediaQuery.of(context).size.width,
            height: 160,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}
