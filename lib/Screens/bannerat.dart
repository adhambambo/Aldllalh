import 'package:carousel_slider/carousel_slider.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/Item_model.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FactoryImages {
  static String? imageUrl1;
  static String? imageUrl2;
  static String? imageUrl3;
  static String? imageUrl4;
}

class banarat extends StatefulWidget {
  final List<ItemModel> placesList;

  banarat({Key? key, required this.placesList}) : super(key: key);

  @override
  State<banarat> createState() => _banaratState();
}

class _banaratState extends State<banarat> {
  final Stream<QuerySnapshot> topRatedStream = FirebaseFirestore.instance
      .collection('places/places/places')
      .orderBy('row', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: topRatedStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No Data Available',
                style: TextStyle(color: kPrimaryColor),
              ),
            );
          }
          return Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 18, right: 18, bottom: 0),
            child: Container(
              child: CarouselSlider.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index, realIndex) {
                  var factoryData =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  if (factoryData.containsKey('text')) {}

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => banaratinfo(factoryData: factoryData));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 8, right: 8, bottom: 0),
                        ),
                        // عرض الصورة
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)), //
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Image.network(
                              factoryData['image'],
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: 160,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 300,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  viewportFraction: 0.8,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class banaratinfo extends StatefulWidget {
  final Map<String, dynamic> factoryData;

  banaratinfo({Key? key, required this.factoryData}) : super(key: key);

  @override
  State<banaratinfo> createState() => _banaratinfoState();
}

class _banaratinfoState extends State<banaratinfo> {
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Text(widget.factoryData['text'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                    textDirection: TextDirection.rtl),
                SizedBox(
                  height: 5,
                ),
                Text('العنوان: ${widget.factoryData['address']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: [
                      if (widget.factoryData['image1'] != null)
                        buildImageWidget(widget.factoryData['image1']),
                      if (widget.factoryData['image2'] != null)
                        buildImageWidget(widget.factoryData['image2']),
                      if (widget.factoryData['image3'] != null)
                        buildImageWidget(widget.factoryData['image3']),
                      if (widget.factoryData['image4'] != null)
                        buildImageWidget(widget.factoryData['image4']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (widget.factoryData['facebook'] != null &&
                              widget.factoryData['facebook'].isNotEmpty)
                            SocialIcon(
                              icon: FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              onTap: () {
                                launchFacebookFromFirestore();
                              },
                            ),
                          if (widget.factoryData['phone'] != null &&
                              widget.factoryData['phone'].isNotEmpty)
                            SocialIcon(
                              icon: FontAwesomeIcons.phone,
                              color: Colors.green,
                              onTap: () {
                                makePhoneCallFromFirestore();
                              },
                            ),
                          if (widget.factoryData['whats'] != null &&
                              widget.factoryData['whats'].isNotEmpty)
                            SocialIcon(
                              icon: FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              onTap: () {
                                launchWhatsAppFromFirestore();
                              },
                            ),
                          if (widget.factoryData['tele'] != null &&
                              widget.factoryData['tele'].isNotEmpty)
                            SocialIcon(
                              icon: FontAwesomeIcons.telegram,
                              color: Color.fromARGB(255, 44, 123, 175),
                              onTap: () {
                                launchTelegramFromFirestore();
                              },
                            ),
                          if (widget.factoryData['insta'] != null &&
                              widget.factoryData['insta'].isNotEmpty)
                            SocialIcon(
                              icon: FontAwesomeIcons.instagram,
                              color: Color.fromARGB(255, 248, 103, 19),
                              onTap: () {
                                launchInstagramFromFirestore();
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageWidget(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey,
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  void launchFacebookFromFirestore() async {
    String facebookLink = widget.factoryData['facebook'];

    final String facebookUrl = "$facebookLink";

    try {
      await launch(facebookUrl);
    } catch (e) {
      print("Error launching facebook: $e");
    }
  }

  void makePhoneCallFromFirestore() async {
    String phoneNumber = widget.factoryData['phone'];

    makePhoneCall(phoneNumber);
  }

  void launchWhatsAppFromFirestore() async {
    String whatsappLink = widget.factoryData['whats'];
    launchWhatsApp(whatsappLink);
  }

  void launchTelegramFromFirestore() async {
    String telegramLink = widget.factoryData['tele'];

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
    String instagramLink = widget.factoryData['insta'];

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
