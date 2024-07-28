import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Exhibtions/ExpoKids.dart';
import 'package:eldalala/Screens/Exhibtions/cairoFashion.dart';
import 'package:eldalala/Screens/Exhibtions/defelihKids.dart';
import 'package:eldalala/Screens/Exhibtions/lapijamaKids.dart';
import 'package:eldalala/Screens/Exhibtions/models.dart';
import 'package:eldalala/Screens/Exhibtions/nilleKids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homeexhition extends StatelessWidget {
  const Homeexhition({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('معارض'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: 
       GridView.count(
        
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(onTap: (){
           Get.to(()=> defilihKids());
          },
            child: buildGridItem('assets/defilih.jpg', " ديفيليه كيدز")),

GestureDetector(
            onTap: (){
              Get.to(()=>  nilikids());
            },
            child: buildGridItem('assets/nilly.jpg', 'نيللي كيدز')),
          GestureDetector(
            onTap: (){
              Get.to(()=>  expokids());
            },
            child: buildGridItem('assets/ExpoKids.jpg', 'اكسبو كيدز')),
          GestureDetector(
            onTap:(){
              Get.to(()=> lapijamakids());
            } ,
            child: buildGridItem('assets/lapyjama.jpg', 'لابجاما')),
             GestureDetector(
            onTap:(){
              Get.to(()=> cairoFashion());
            } ,
            child: buildGridItem('assets/cairoFashion.jpg', 'كايرو فاشون ')),
        ],
      ),
    );
    
  }
}