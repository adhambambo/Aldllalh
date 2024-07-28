import 'package:eldalala/ClassesOfCollections/shipping/internationalshipping.dart';
import 'package:eldalala/ClassesOfCollections/shipping/mandeb.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class shipping extends StatelessWidget {
  const shipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('شركات شحن'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مناديب دفع مقدم',
          subtitle: '',
          page: manadeb(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-16%20at%2000.09.10_b3eadac7.jpg?alt=media&token=a10602a2-0be8-49f1-9d01-f74482de1612',
        ),
        MyCard(
          title: 'شركات شحن داخلي ودولي',
          subtitle: '',
          page: internationalshipping(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-16%20at%2000.09.11_4bd96a5f.jpg?alt=media&token=641b012b-9322-499a-8f85-0cb85426d644',
        ),
      ]),
    );
  }
}
