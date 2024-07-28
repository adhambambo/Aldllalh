import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Launchers {
  static void launchFacebook(String facebookLink) async {
    if (await canLaunch(facebookLink)) {
      await launch(facebookLink);
    } else {
      throw 'Could not launch $facebookLink';
    }
  }

  static void makePhoneCall(String phoneNumber) async {
    FlutterPhoneDirectCaller.callNumber(phoneNumber);
  }

  static void launchWhatsApp(String WhatsAppLink) async {
    if (await canLaunch(WhatsAppLink)) {
      await launch(WhatsAppLink);
    } else {
      throw 'Could not launch $WhatsAppLink';
    }
  }

  static void openGoogleMaps(String location) {
    MapsLauncher.launchQuery(location);
  }
}
