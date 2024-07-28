import 'package:eldalala/ClassesOfCollections/clothing_officesess/Ataba,%20Al-Muski%20and%20Al-Ghuriya.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/Boulakia%20Canal.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/Choisly_Sednaoui_quds.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/New%20Nozha%20clothing%20offices.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/Petroleumbuildings.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/Ramobuildings.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/ReadyClothing.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/Roxy%20casual.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/Sales_dealer.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/abaya_offices.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/casual_womens.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/childreen_offices.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/downtown_offices.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/homewear_officese.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/jeans_offices.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/linjerey.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/othersclothoffice.dart';
import 'package:eldalala/ClassesOfCollections/clothing_officesess/youth_and_men.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class ClothingOffices extends StatelessWidget {
  const ClothingOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('مكاتب ملابس'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مكاتب ملابس أطفال',
          subtitle: '',
          page: ChildreenClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0101.jpg?alt=media&token=aa3833d9-8806-4648-8ef2-a9e6a68f9a7f',
        ),
        MyCard(
          title: 'مكاتب ملابس هوم ويير حريمي',
          subtitle: '',
          page: HomewearWomensClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0076.jpg?alt=media&token=bff8178e-7449-4fec-97e2-6e5d0dee2cad',
        ),
        MyCard(
          title: 'مكاتب ملابس كاجوال حريمي حريمي',
          subtitle: '',
          page: CasualWomensClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0085.jpg?alt=media&token=249b2acf-ef6a-4388-b53a-06cb67f0b1c6',
        ),
        MyCard(
          title: 'مكاتب ملابس شبابي ورجالي',
          subtitle: '',
          page: YouthMenClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0074.jpg?alt=media&token=6a91322d-e664-47a7-9409-88db368338c2',
        ),
        MyCard(
          title: 'مكاتب ملابس عبايات واسدالات',
          subtitle: '',
          page: AbayaEsdalatClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0075.jpg?alt=media&token=1da7fe6d-6289-40e1-9702-42f4eebff061',
        ),
        MyCard(
          title: 'مكاتب جينز',
          subtitle: '',
          page: JeansClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0087.jpg?alt=media&token=ea23982c-2030-43c0-80d1-07722acaebf3',
        ),
        MyCard(
          title: 'مكاتب داخلي ولانجري',
          subtitle: '',
          page: LinjeriyClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0073.jpg?alt=media&token=125b6a1d-f80c-43da-a215-f3bafc3fc67c',
        ),
        MyCard(
          title: 'مكاتب ملابس عمارات رامو',
          subtitle: '',
          page: RamoBuildingClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0079.jpg?alt=media&token=0587e406-7f84-404b-84ae-e6d1d2e3a603',
        ),
        MyCard(
          title: 'مكاتب ملابس عمارات البترول',
          subtitle: '',
          page: PetroliumBuildingClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0098.jpg?alt=media&token=59771736-b33b-48f9-bb8f-b8d4d7b90cd6',
        ),
        MyCard(
          title: 'مكاتب ملابس مول الشوازليه وصيدناوي والقدس',
          subtitle: '',
          page: ShoazliaSednawiQudsClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0089.jpg?alt=media&token=9bf75bed-10aa-49bc-a1af-4651cce07b4f',
        ),
        MyCard(
          title: 'مكاتب ملابس العتبة والموسكي والغوريه',
          subtitle: '',
          page: AttabaMouskyClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0086.jpg?alt=media&token=3a9841a8-a268-4cbf-89f1-40d86f5f2283',
        ),
        MyCard(
          title: 'مكاتب ملابس النزهه الجديده',
          subtitle: '',
          page: NewNozhaClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0082.jpg?alt=media&token=192592f2-fff4-46c3-8cac-de6ac3c36e43',
        ),
        MyCard(
          title: 'مكاتب ملابس كاجوال روكسي',
          subtitle: '',
          page: RoxyCasualClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0106.jpg?alt=media&token=12fc3a7d-7902-4167-b9af-b113ac868123',
        ),
        MyCard(
          title: 'مكاتب ملابس وسط البلد',
          subtitle: '',
          page: DOWNTOWNClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0097.jpg?alt=media&token=635ad2aa-516b-4d48-b481-cb89e00b3034',
        ),
        MyCard(
          title: 'مكاتب ملابس الترعه البولاقيه',
          subtitle: '',
          page: BoulaqCanalClothingOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0083.jpg?alt=media&token=d730e2c5-288d-41d9-889b-7bcf9c35254a',
        ),
        MyCard(
            title: 'مكاتب ملابس جاهزة',
            subtitle: '',
            page: readyClothingOffices(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/upload%2FBanking%20and%20Finance%20Trade%20Show%20Banner%20in%20Purple%20Teal%20Friendly%20Corporate%20Style%20(1).jpg?alt=media&token=7e48257a-2e72-4a9d-9da9-ce490b869faf'),
                 MyCard(
            title: 'تجار بيعات',
            subtitle: '',
            page: SalesDellares(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-06-23%20at%2005.39.17_931a1e2a.jpg?alt=media&token=2f1b4217-c24a-4b1f-898c-9fe9d0c6c844'),
        MyCard(
            title: 'مكاتب ملابس اخري',
            subtitle: '',
            page: othersClothingOffices(),
            imagePath:
                'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-11%20at%2002.59.30_a5f05eb7.jpg?alt=media&token=97495aef-9cc6-4b7e-bbdf-d65b8988c759'),
      ]),
    );
  }
}
