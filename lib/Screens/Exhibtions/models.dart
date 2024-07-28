import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:flutter/material.dart';

Widget buildGridItem(String imagePath, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 120,
            height: 90,
          ),
          SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }