import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.fontWeight = FontWeight.normal,
    this.decoration,
    this.direction, // إضافة decoration كمعامل جديد
  }) // إضافة fontWeight كمعامل جديد
  : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight; // إضافة معامل fontWeight
  final TextDecoration? decoration; // استخدام decoration هنا
  final TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight, // استخدام معامل fontWeight هنا
          decoration: decoration, // استخدام decoration هنا
        ),
        textDirection: direction,
      ),
    );
  }
}
