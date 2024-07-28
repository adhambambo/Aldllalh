import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ChildreenbannersInfo extends StatefulWidget {
  final Map<String, dynamic> factoryDatatwo;

  ChildreenbannersInfo({Key? key, required this.factoryDatatwo})
      : super(key: key);

  @override
  State<ChildreenbannersInfo> createState() => _ChildreenbannersInfoState();
}

class _ChildreenbannersInfoState extends State<ChildreenbannersInfo> {
  final Stream<QuerySnapshot> childreenFactories = FirebaseFirestore.instance
      .collection('مصانع/مصانع ملابس/مصانع ملابس اطفال')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'معلومات عن المكان',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          // استخدم widget.factoryData للوصول إلى البيانات
          child: Column(
            children: [
              Text(widget.factoryDatatwo['text'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.factoryDatatwo['facebook'] != null &&
                      widget.factoryDatatwo['facebook'].isNotEmpty)
                    SocialIcon(
                      icon: FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      onTap: () {
                        launchFacebookFromFirestore();
                      },
                    ),
                  if (widget.factoryDatatwo['phone'] != null &&
                      widget.factoryDatatwo['phone'].isNotEmpty)
                    SocialIcon(
                      icon: FontAwesomeIcons.phone,
                      color: Colors.green,
                      onTap: () {
                        makePhoneCallFromFirestore();
                      },
                    ),
                  if (widget.factoryDatatwo['whats'] != null &&
                      widget.factoryDatatwo['whats'].isNotEmpty)
                    SocialIcon(
                      icon: FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                      onTap: () {
                        launchWhatsAppFromFirestore();
                      },
                    ),
                  if (widget.factoryDatatwo['tele'] != null &&
                      widget.factoryDatatwo['tele'].isNotEmpty)
                    SocialIcon(
                      icon: FontAwesomeIcons.telegram,
                      color: Color.fromARGB(255, 44, 123, 175),
                      onTap: () {
                        launchTelegramFromFirestore();
                      },
                    ),
                  if (widget.factoryDatatwo['insta'] != null &&
                      widget.factoryDatatwo['insta'].isNotEmpty)
                    SocialIcon(
                      icon: FontAwesomeIcons.instagram,
                      color: Color.fromARGB(255, 248, 103, 19),
                      onTap: () {
                        launchInstagramFromFirestore();
                      },
                    ),
                ],
              ),
              Center(
                child: Text('صور المكان:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                    textDirection: TextDirection.rtl),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryDatatwo['image1'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryDatatwo['image2'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryDatatwo['image3'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryDatatwo['image4'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchFacebookFromFirestore() async {
    // استخراج الرابط المباشر من الفيرستور
    String facebookLink = widget.factoryDatatwo['facebook'];

    final String facebookUrl = "$facebookLink";

    try {
      await launch(facebookUrl);
    } catch (e) {
      print("Error launching facebook: $e");
    }
  }

  void makePhoneCallFromFirestore() async {
    String phoneNumber = widget.factoryDatatwo['phone'];

    makePhoneCall(phoneNumber);
  }

  void launchWhatsAppFromFirestore() async {
    String whatsappLink = widget.factoryDatatwo['whats'];
    launchWhatsApp(whatsappLink);
  }

  void launchTelegramFromFirestore() async {
    String telegramLink = widget.factoryDatatwo['tele'];

    _launchTelegram(telegramLink);
  }

  void _launchTelegram(String telegramLink) async {
    final String telegramUrl = "$telegramLink";
    try {
      await launch(telegramUrl);
    } catch (e) {
      print("Error launching telegram: $e");
    }
  }

  void launchInstagramFromFirestore() async {
    String instagramLink = widget.factoryDatatwo['insta'];

    _launchInstagram(instagramLink);
  }

  void _launchInstagram(String instagramLink) async {
    final String instagramUrl = "$instagramLink";
    try {
      await launch(instagramUrl);
    } catch (e) {
      print("Error launching instagram: $e");
    }
  }
}
