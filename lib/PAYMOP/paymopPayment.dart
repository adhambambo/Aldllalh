import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/PAYMOP/paymobManager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class paymobpaymentend extends StatelessWidget {
  const paymobpaymentend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المدفوعات'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: ElevatedButton(
        onPressed: () async => _pay(),
        child: const Text("Pay 10 EGP"),
      ),
    );
  }
}

Future<void> _pay() async {
  PaymobManager().getPaymentKey(10, "EGP").then((String paymentKey) {
    launchUrl(
      Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/835635?payment_token=$paymentKey"),
    );
  });
}

















