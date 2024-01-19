import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController nameController;
  final TextInputType keyboardType;
  final String text;
  Color hintColor=Colors.grey;
  bool isSelected=false;

  MyTextField(
      {super.key,
      required this.keyboardType,
      required this.nameController,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color:hintColor,fontSize: 24 ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: hintColor)
        ),
        contentPadding:const  EdgeInsets.all(16),
      ),
      keyboardType: keyboardType,

    );
  }
}
