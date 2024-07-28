import 'package:eldalala/ClassesOfCollections/textile_merchantss/18th_ST_gesrSuez.dart';
import 'package:eldalala/ClassesOfCollections/textile_merchantss/Al-Balah%20Agency.dart';
import 'package:eldalala/ClassesOfCollections/textile_merchantss/elazhr_ghorya.dart';
import 'package:eldalala/ClassesOfCollections/textile_merchantss/elmatrya.dart';
import 'package:eldalala/ClassesOfCollections/textile_merchantss/others.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class TextileMerchants extends StatelessWidget {
  const TextileMerchants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('تجار اقمشة'),
      ),
      body: CardList(
        cards: [
          MyCard(
            title: 'اقمشه الازهر والغوريه',
            subtitle: '',
            page: ElazhrAndGhoryaTextileMerchants(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0110.jpg?alt=media&token=000bdfc7-9750-41c9-adbf-8525d600df56',
          ),
          MyCard(
            title: 'اقمشه شارع 18 جسر السويس',
            subtitle: '',
            page: GesrSuezTextileMerchants(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0108.jpg?alt=media&token=46a57fd8-d633-409b-b059-13026693dc5f',
          ),
          MyCard(
            title: 'اقمشه المطريه',
            subtitle: '',
            page: ElmatryaTextileMerchants(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0112.jpg?alt=media&token=ef97e963-ac37-4392-aa1e-cfb5c168c1c4',
          ),
          MyCard(
            title: 'اقمشه وكالة البلح',
            subtitle: '',
            page: AlbalhTextileMerchants(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0111.jpg?alt=media&token=4f2c4fff-3747-4467-9b40-1f4c0dd78109',
          ),
          MyCard(
              title: 'تجار اقمشة أخري',
              subtitle: '',
              page: OTHERSTextileMerchants(),
              imagePath:
                  'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/upload%2FBanking%20and%20Finance%20Trade%20Show%20Banner%20in%20Purple%20Teal%20Friendly%20Corporate%20Style%20(2).jpg?alt=media&token=4d24333f-4847-4d62-aedd-b249854669c8'),
        ],
      ),
    );
  }
}
