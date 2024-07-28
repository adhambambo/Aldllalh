import 'package:eldalala/ClassesOfCollections/shops/abayaaa.dart';
import 'package:eldalala/ClassesOfCollections/shops/cosemetics.dart';
import 'package:eldalala/ClassesOfCollections/shops/jeans.dart';
import 'package:eldalala/ClassesOfCollections/shops/linjeriy.dart';
import 'package:eldalala/ClassesOfCollections/shops/othersshops.dart';
import 'package:eldalala/ClassesOfCollections/shops/shoes.dart';
import 'package:eldalala/ClassesOfCollections/shops/youth_AND_men.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

import '../ClassesOfCollections/shops/childreen.dart';
import '../ClassesOfCollections/shops/womens_casual.dart';
import '../ClassesOfCollections/shops/womens_home.dart';

class shops extends StatelessWidget {
  const shops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('محلات'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'محلات ملابس اطفال',
          subtitle: '',
          page: Childreenshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0062.jpg?alt=media&token=bbe19c76-32dd-4173-a010-ea608a0b3d61',
        ),
        MyCard(
          title: 'محلات ملابس حريمي بيتي',
          subtitle: '',
          page: WomensHomeshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0060.jpg?alt=media&token=5a7ea65c-b043-48cc-8b5f-768bd0d08b65',
        ),
        MyCard(
          title: 'محلات حريمي كاجوال',
          subtitle: '',
          page: WomensCasulaShops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0059.jpg?alt=media&token=9440c30a-4d58-4091-ab39-2802af839031',
        ),
        MyCard(
          title: 'محلات ملابس شبابي ورجالي',
          subtitle: '',
          page: YouthMenShops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0126.jpg?alt=media&token=3e0244e8-6952-4571-b085-4169a284ff42',
        ),
        MyCard(
          title: 'محلات عبايات واسدالات ',
          subtitle: '',
          page: AbyatEsdalatShops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0058.jpg?alt=media&token=ddf88b1d-a951-4ca8-a51d-c06ad10d774d',
        ),
        MyCard(
          title: 'محلات جينز ',
          subtitle: '',
          page: Jeansshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0124.jpg?alt=media&token=42c70209-d3b3-436b-b085-051bf203107d',
        ),
        MyCard(
          title: 'محلات احذيه',
          subtitle: '',
          page: Shoesshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0123.jpg?alt=media&token=22449cec-1f91-459b-8a30-6c36dfa9c726',
        ),
        MyCard(
          title: 'محلات لانجري',
          subtitle: '',
          page: Linjerieyshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0061.jpg?alt=media&token=bdcbed5e-45b6-41d7-b338-94b859879526',
        ),
        MyCard(
          title: 'محلات مستحضرات تجميل',
          subtitle: '',
          page: cosemeticsshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0121.jpg?alt=media&token=9d97c21f-dc75-42ae-b181-a20aabdc1777',
        ),
        MyCard(
          title: 'محلات اخري',
          subtitle: '',
          page: Othersshops(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-11%20at%2002.59.30_a5f05eb7.jpg?alt=media&token=97495aef-9cc6-4b7e-bbdf-d65b8988c759',
        ),
      ]),
    );
  }
}
