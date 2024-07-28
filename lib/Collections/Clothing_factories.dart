import 'package:eldalala/ClassesOfCollections/clothing_factoriess/10thRamdan_Factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Abaya_clothing_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Gesr_AlSuez_clothing_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Homewear_clothing_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Kardasa_abaya_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Readymade.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Womens_casual_clothing_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/Youth_and_mens_clothing_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/childreenFctories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/jeans_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/lanjeriey_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/manufacturing_ForOthe.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/obour_factories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/otherclothfac.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/readyelmahala.dart';
import 'package:eldalala/ClassesOfCollections/clothing_factoriess/skirt_factories.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class ClothingFactories extends StatelessWidget {
  const ClothingFactories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: const Text('مصانع ملابس'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مصانع ملابس أطفال ',
          subtitle: '',
          page: ChildreenClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0094.jpg?alt=media&token=483a9cde-e920-48ed-b692-b73168ae405b',
        ),
        MyCard(
          title: 'مصانع ملابس هوم ويير حريمي',
          subtitle: '',
          page: HomeWearWomenClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0088.jpg?alt=media&token=2c9ab99b-ae23-4cdc-a79a-ee38ed464542',
        ),
        MyCard(
          title: 'مصانع ملابس كاجوال حريمي ',
          subtitle: '',
          page: WomensCasualssClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0117.jpg?alt=media&token=b474e7f7-bb71-4c28-b85c-0dc1cc136db1',
        ),
        MyCard(
          title: 'مصانع ملابس شبابي ورجالي',
          subtitle: '',
          page: YouthAndMenClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0067.jpg?alt=media&token=a9272474-04c4-4d3d-aaad-1aec4c189602',
        ),
        MyCard(
          title: 'مصانع ملابس عبايات واسدالات ',
          subtitle: '',
          page: AbayatEsdalatClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0103.jpg?alt=media&token=1aed315d-947c-453d-acd4-046bc1c603b6',
        ),
        MyCard(
          title: 'مصانع جينز ',
          subtitle: '',
          page: JeansClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0068.jpg?alt=media&token=8bb553db-6f0e-415c-ab72-881f96ad1d15',
        ),
        MyCard(
          title: 'مصانع داخلي ولانجري',
          subtitle: '',
          page: LinjeriyClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0072.jpg?alt=media&token=e0bb7f1f-3f5c-45f6-942d-70b165b69c1c',
        ),
        MyCard(
          title: 'مصانع طرح ومكملات حجاب',
          subtitle: '',
          page: SkirtHegabClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0077.jpg?alt=media&token=b00c2e89-adca-40e6-ba6e-1ad0bc4a52fc',
        ),
        MyCard(
          title: 'مصانع عبايات كرداسه ',
          subtitle: '',
          page: KerdasaAbayaClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0093.jpg?alt=media&token=eaeacef3-65b3-44b3-8292-2043de715fa2',
        ),
        MyCard(
          title: 'مصانع ملابس جسر السويس ',
          subtitle: '',
          page: GesrElsuezClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0105.jpg?alt=media&token=7ae5c5f2-e409-4db1-b32a-9366a28108cc',
        ),
        MyCard(
          title: 'مصانع ملابس مدينة العبور ',
          subtitle: '',
          page: ObourCityClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0078.jpg?alt=media&token=b6f0afc1-c9d1-4a5b-973d-0e2ceb066be5',
        ),
        MyCard(
          title: 'مصانع ملابس العاشر من رمضان ',
          subtitle: '',
          page: RamdanClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0084.jpg?alt=media&token=222fcd96-65c5-45a1-8641-325e10ab76c3',
        ),
          MyCard(
          title: 'مصانع ملابس جاهزة',
          subtitle: '',
          page: readyMadeClothingFac(),
          imagePath:
             'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/upload%2FWhatsApp%20Image%202024-04-30%20at%2004.14.47_ef3526d0.jpg?alt=media&token=3730ded6-a779-4d92-83f1-692476aa6f51',
        ),
         MyCard(
          title: 'مصانع ملابس جاهزة المحله الكبري',
          subtitle: '',
          page: readyMadeelmhalaClothingFac(),
          imagePath:
             'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/upload%2FWhatsApp%20Image%202024-04-30%20at%2004.14.47_20827b57.jpg?alt=media&token=9af0dd18-cfa3-44fd-bb22-d1a3a308ac2e',
        ),
        MyCard(
          title: 'تصنيع للغير',
          subtitle: '',
          page: ForOthersClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0115.jpg?alt=media&token=e4232654-b6ab-43a3-8fdf-baaeb73f0a21',
        ),
        MyCard(
          title: 'مصانع ملابس أخري ',
          subtitle: '',
          page: othersClothingFactories(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-11%20at%2002.59.30_a5f05eb7.jpg?alt=media&token=97495aef-9cc6-4b7e-bbdf-d65b8988c759',
        ),
      ]),
    );
  }
}
