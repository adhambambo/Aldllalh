import 'package:eldalala/ClassesOfCollections/bedding_furnishing/Blankets.dart';
import 'package:eldalala/ClassesOfCollections/bedding_furnishing/Towels,%20bed%20sheets%20and%20quilts.dart';
import 'package:eldalala/ClassesOfCollections/bedding_furnishing/curtains.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';
import '../ClassesOfCollections/bedding_furnishing/tangeed.dart';

class BeddingFurnishing extends StatelessWidget {
  const BeddingFurnishing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('وبريات ومفروشات'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'ستائر',
          subtitle: '',
          page: CurtainsBeddingFurnishing(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0114.jpg?alt=media&token=63e9a7c2-4206-4ac5-aa8c-f5b0220a4351',
        ),
        MyCard(
          title: 'اقمشه تنجيد',
          subtitle: '',
          page: TangeedsBeddingFurnishing(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0107.jpg?alt=media&token=8d834bc4-7e8f-425f-8e7e-d6a474fd2e3d',
        ),
        MyCard(
          title: 'فوط وملايات سرير والحفه',
          subtitle: '',
          page: TowesSheetssBeddingFurnishing(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0113.jpg?alt=media&token=e462df2e-455a-4695-8f95-2862224002ff',
        ),
        MyCard(
          title: 'بطاطين ودفايات',
          subtitle: '',
          page: BlanketsBeddingFurnishing(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0109.jpg?alt=media&token=ad048dd8-cd97-4f1f-8458-98fd09cf5499',
        ),
      ]),
    );
  }
}
