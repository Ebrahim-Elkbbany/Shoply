import 'package:flutter/material.dart';
import 'package:shoply/features/category/view/ui/category.dart';



class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.button_text}) : super(key: key);
  final String button_text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ))),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>Category()));
        },
        child: Text(
          button_text,
          style: TextStyle(color: Colors.white70),
        ));
  }
}
