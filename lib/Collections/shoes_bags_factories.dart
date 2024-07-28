import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/Kochi.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/Popular%20shoes.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/bags.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/belt.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/lux_men.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/lux_women.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/othersshoesfac.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags,factories/slingbacks.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class ShoesBagsFactories extends StatelessWidget {
  const ShoesBagsFactories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('مصانع احذية وشنط'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مصانع أحذية كوتشي',
          subtitle: '',
          page: KochiShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0065.jpg?alt=media&token=31112278-74e4-4637-a71c-699092cf2e0c',
        ),
        MyCard(
          title: 'مصانع أحذية خفيفة',
          subtitle: '',
          page: SlingbacksShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0120.jpg?alt=media&token=a17f44ab-0e70-4161-a29a-15f5cd3d1a39',
        ),
        MyCard(
          title: 'مصانع أحذية شعبي',
          subtitle: '',
          page: PopularShoesShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0064.jpg?alt=media&token=58abc49a-c442-40b5-895c-1aa1f95d06cb',
        ),
        MyCard(
          title: 'مصانع أحذية لوكس حريمي',
          subtitle: '',
          page: LUXWomenShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0125.jpg?alt=media&token=d8999290-aa0e-41d9-903d-272533061967',
        ),
        MyCard(
          title: 'مصانع أحذية لوكس رجالي',
          subtitle: '',
          page: LuxMenShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0127.jpg?alt=media&token=c354f310-ae99-42a3-bf60-f74ac7eca7f4',
        ),
        MyCard(
          title: 'مصانع شنط',
          subtitle: '',
          page: BagsShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0091.jpg?alt=media&token=2978189c-c840-494c-a3c3-8ea1411d2dae',
        ),
        MyCard(
          title: 'مصانع حزام',
          subtitle: '',
          page: BeltShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0071.jpg?alt=media&token=a0f5463c-d276-40f5-a33a-5cbf49b9a375',
        ),
        MyCard(
          title: 'مصانع احذية وشنط اخري',
          subtitle: '',
          page: othersShoesBagsFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-11%20at%2002.59.30_a5f05eb7.jpg?alt=media&token=97495aef-9cc6-4b7e-bbdf-d65b8988c759',
        ),
      ]),
    );
  }
}
