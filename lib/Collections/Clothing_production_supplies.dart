import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/Al-Moski%20clothing%20accessories.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/Machines%20and%20machines.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/Printing.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/Zippers,%20hangers%20and%20bags.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/accssesoriesGesrSuez.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/accssesories_18thST.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/othersclothsuplies.dart';
import 'package:eldalala/ClassesOfCollections/clothing_production_supplies/press%20and%20transfer.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class ClothingProduction extends StatelessWidget {
  const ClothingProduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('مستلزمات انتاج ملابس'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مصانع سوست وشماعات واكياس',
          subtitle: '',
          page: ZippersHangersClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0090.jpg?alt=media&token=57e43f10-9d39-44ed-80c8-2e2c3792176b',
        ),
        MyCard(
          title: 'اكسسوارات ملابس حارة المزين الموسكي',
          subtitle: '',
          page: AlmoskiClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0116.jpg?alt=media&token=94a60169-3bcd-4783-a743-fa2101e8dc31',
        ),
        MyCard(
          title: 'اكسسوارات ملابس شارع 18 ',
          subtitle: '',
          page: EghteenStClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0119.jpg?alt=media&token=acb15ff9-1f74-48e6-8721-154ed0e32f3b',
        ),
        MyCard(
          title: 'اكسسوارات ملابس الجراج جسر السويس',
          subtitle: '',
          page: GarageGesrSuezClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0122.jpg?alt=media&token=db09297a-6223-44ff-8bd7-bb69eaa7a96b',
        ),
        MyCard(
          title: 'مطابع ',
          subtitle: '',
          page: printingClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0092.jpg?alt=media&token=0c869fc2-98d6-430a-8add-9650fbf74332',
        ),
        MyCard(
          title: 'كبس استرس وترانسفير',
          subtitle: '',
          page: pressTransfeClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0118.jpg?alt=media&token=4f8250a0-c731-4acd-b579-84556386f912',
        ),
        MyCard(
          title: 'مكن والات',
          subtitle: '',
          page: MachineMachinesClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0081.jpg?alt=media&token=263f236d-935b-49c6-8c2f-e72622607d15',
        ),
        MyCard(
          title: 'أخري',
          subtitle: '',
          page: otherClothingProductionSupplies(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-11%20at%2002.59.30_a5f05eb7.jpg?alt=media&token=97495aef-9cc6-4b7e-bbdf-d65b8988c759',
        ),
      ]),
    );
  }
}
