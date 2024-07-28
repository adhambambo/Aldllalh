import 'package:eldalala/ClassesOfCollections/Emarketing/Affiliates.dart';
import 'package:eldalala/ClassesOfCollections/Emarketing/emarketingcompany.dart';

import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class Emarketings extends StatelessWidget {
  const Emarketings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('تسويق الكتروني'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'شركات تسويق الكتروني',
          subtitle: '',
          page: EmarketingCompany(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-20%20at%2016.08.13_6e3eb3c7.jpg?alt=media&token=d113caa2-5793-4c89-a135-4827fca29473',
        ),
        MyCard(
          title: 'مسوقات بالعمولة',
          subtitle: '',
          page: Affiliates(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-20%20at%2016.08.13_009b32ba.jpg?alt=media&token=23f6db14-58d3-4aee-872e-da7932771a3f',
        ),
      ]),
    );
  }
}
