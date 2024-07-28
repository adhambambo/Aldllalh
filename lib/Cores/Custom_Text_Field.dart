import 'package:eldalala/Cores/Custom_Text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSaved,
    this.validator,
    this.keyboardType,
    this.mycontroller,
    this.direction, required this.prefixIcon,
  }) : super(key: key);

  final String text;
  final String hint;
  final void Function(String?) onSaved; // تحديد نوع الدالة لـ onSaved
  final String? Function(String?)? validator; // تحديد نوع الدالة لـ validator
  final TextInputType? keyboardType; // إضافة الخاصية هنا
  final TextEditingController? mycontroller;
  final TextDirection? direction;
  final Icon prefixIcon;
  int? maxLines ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
       CustomText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: mycontroller,
              onSaved: onSaved,
              keyboardType: keyboardType,
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 12),
                helperStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintTextDirection: direction,
                prefixIcon: prefixIcon,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    mycontroller!.clear();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
