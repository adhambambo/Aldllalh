import 'package:eldalala/AdmobADS/AdsInterstitialAd.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/Item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ListItemOnline extends StatefulWidget {
  final ItemModel item;
  const ListItemOnline({required this.item});

  @override
  State<ListItemOnline> createState() => _ListItemOnlineState();
}

class _ListItemOnlineState extends State<ListItemOnline> {
  @override
  void setState(VoidCallback fn) {
    AdsInterstitial().showAd();
    super.setState(fn);
  }

  void _launchFacebook() async {
    final String facebookLink = widget.item.facebookLink;
    final String facebookUrl = "$facebookLink";

    try {
      await launch(facebookUrl);
    } catch (e) {
      print("Error launching facebook: $e");
    }
  }

  void _launchWhatsApp() async {
    final String WhatsAppLink = widget.item.WhatsAppLink;
    final String whatsappUrl = "whatsapp://send?phone=$WhatsAppLink";

    try {
      await launch(whatsappUrl);
    } catch (e) {
      print("Error launching WhatsApp: $e");
    }
  }

  void _makePhoneCall() async {
    final String phoneNumber = widget.item.phoneNumber;
    FlutterPhoneDirectCaller.callNumber(phoneNumber);
  }

  void _openGoogleMaps(String location) {
    MapsLauncher.launchQuery(location);
  }

  void _launchInstagram() async {
    final String instagramLink = widget.item.instagramLink;
    final String instagramUrl = "$instagramLink";
    try {
      await launch(instagramUrl);
    } catch (e) {
      print("Error launching instagram: $e");
    }
  }

  void _launchTelegram() async {
    final String telegramLink = widget.item.telegramLink;
    final String telegramUrl = "$telegramLink";
    try {
      await launch(telegramUrl);
    } catch (e) {
      print("Error launching telegram: $e");
    }
  }

  void _launchTikTok() async {
    final String tiktokLink = widget.item.tiktokLink!;
    final String tiktokUrl = "$tiktokLink";

    try {
      await launch(tiktokUrl);
    } catch (e) {
      print("Error launching tiktok: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 300,
      child: Row(
        children: [
          Container(
            width: 150,
            color: const Color.fromARGB(255, 97, 82, 82),
            child: Image.network(
              widget.item.image,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child; // إذا تم تحميل الصورة بنجاح، عرض الصورة
                } else {
                  // إذا كان التحميل مستمرًا، عرض رمز التحميل هنا
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                    'assets/logo0.jpg'); // تحديد الصورة الافتراضية
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.item.placeName,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: kPrimaryColor,
                  ),
                ),
                if (widget.item.address != null &&
                    widget.item.address.isNotEmpty)
                  Text(
                    "العنوان: ${widget.item.address}",
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                SizedBox(
                  height: 8,
                ),
                if (widget.item.facebookLink != null &&
                    widget.item.facebookLink
                        .isNotEmpty) // التحقق من وجود رابط فيسبوك
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));
                          await AdsInterstitial().showAd();
                          _launchFacebook();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));
                          await AdsInterstitial().showAd();
                          _launchFacebook();
                        },
                        child: Text(
                          '${widget.item.facebookCustomText}',
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                if (widget.item.phoneNumber != null &&
                    widget.item.phoneNumber.isNotEmpty)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _makePhoneCall();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.phone,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _makePhoneCall();
                        },
                        child: Text(
                          " : ${widget.item.phoneCustomText}",
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                if (widget.item.WhatsAppLink != null &&
                    widget.item.WhatsAppLink.isNotEmpty)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial()
                              .showAd(); // انتظر حتى يتم عرض الإعلان

                          _launchWhatsApp(); // بعد ذلك، افتح تطبيق WhatsApp
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();

                          _launchWhatsApp(); // بعد ذلك، افتح تطبيق WhatsApp
                        },
                        child: Text(
                          " : ${widget.item.WhatsAppCustomText}",
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                if (widget.item.instagramLink != null &&
                    widget.item.instagramLink.isNotEmpty)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Future.delayed(Duration(seconds: 2));
                          await AdsInterstitial().showAd();
                          _launchInstagram();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.pink,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _launchInstagram();
                        },
                        child: Text(
                          '${widget.item.instagramCustomText}',
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                if (widget.item.telegramLink != null &&
                    widget.item.telegramLink.isNotEmpty)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));
                          await AdsInterstitial().showAd();
                          _launchTelegram();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.telegram,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _launchTelegram();
                        },
                        child: Text(
                          '${widget.item.telegramCustomText}',
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                if (widget.item.tiktokLink != null &&
                    widget.item.tiktokLink!
                        .isNotEmpty) // التحقق من وجود رابط فيسبوك
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _launchTikTok();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.tiktok,
                          color: Colors.pink,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          await Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _launchTikTok();
                        },
                        child: Text(
                          '${widget.item.facebookCustomText}',
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                if (widget.item.location != null &&
                    widget.item.location.isNotEmpty)
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green[400],
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Future.delayed(Duration(seconds: 2));

                          await AdsInterstitial().showAd();
                          _openGoogleMaps(widget.item.location);
                        },
                        child: Text(
                          ": ${widget.item.locationCustomText}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                                            const SizedBox(height: 12),

                    ],
                  ),
               
              ],
              
            ),
            
          ),
        ],
      ),
    );
  }
}
