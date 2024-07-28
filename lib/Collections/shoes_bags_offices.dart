import 'package:eldalala/ClassesOfCollections/shoes_bags_officesess/Importers%20and%20offices.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags_officesess/bab_elshaarya.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags_officesess/new_nozha.dart';
import 'package:eldalala/ClassesOfCollections/shoes_bags_officesess/others.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class ShoesBagsOffices extends StatelessWidget {
  const ShoesBagsOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('مكاتب احذية وشنط'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مستوردين ومكاتب احذيه وشنط',
          subtitle: '',
          page: importersShoesBagsOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0063.jpg?alt=media&token=2b69df0e-426f-4b14-af87-6b8ee28c0a80',
        ),
        MyCard(
          title: 'مكاتب احذيه وشنط باب الشعريه',
          subtitle: '',
          page: BabElsharyeaShoesBagsOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-01-27%20at%2016.04.11_58c5da3c.jpg?alt=media&token=4bc1fd81-4a00-4374-88f3-357c20ca6a90',
        ),
        MyCard(
          title: 'مكاتب احذيه وشنط النزهه الجديده',
          subtitle: '',
          page: NewNozhaShoesBagsOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0080.jpg?alt=media&token=8ffa94d6-1e24-4236-8d3e-7dab6489b770',
        ),
        MyCard(
          title: 'مكاتب احذيه وشنط أخري ',
          subtitle: '',
          page: othersShoesBagsOffices(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FWhatsApp%20Image%202024-03-11%20at%2002.59.30_a5f05eb7.jpg?alt=media&token=97495aef-9cc6-4b7e-bbdf-d65b8988c759',
        ),
      ]),
    );
  }
}
