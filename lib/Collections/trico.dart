import 'package:eldalala/ClassesOfCollections/trico/Tanmal.dart';
import 'package:eldalala/ClassesOfCollections/trico/aja_mansoura.dart';
import 'package:eldalala/ClassesOfCollections/trico/trico_factories.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:flutter/material.dart';

class Trico extends StatelessWidget {
  const Trico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('تريكو'),
      ),
      body: CardList(cards: [
        MyCard(
          title: 'مصانع طنامل',
          subtitle: '',
          page: TanamalTrico(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0069.jpg?alt=media&token=61d18378-59b0-47c0-a294-fc90ac926895',
        ),
        MyCard(
          title: 'مصانع أجا - المنصوره',
          subtitle: '',
          page: AgaMansouraTrico(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0066.jpg?alt=media&token=c4a48d9a-7767-43ad-8028-08e63e8844fd',
        ),
        MyCard(
          title: 'مصانع تريكو',
          subtitle: '',
          page: tricoTrico(),
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/eldalala-2d156.appspot.com/o/%D8%B5%D9%88%D8%B1%20%D9%81%D8%A6%D8%A7%D8%AA%20%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9%2FIMG-20231230-WA0070.jpg?alt=media&token=d35c1770-99a4-46ee-9b3e-9a02be09e910',
        ),
      ]),
    );
  }
}
