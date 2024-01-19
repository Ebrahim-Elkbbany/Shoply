import 'package:flutter/material.dart';
import 'package:shoply/signup-login/shared_customs/constants_class.dart';


class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {Key? key,
      required this.nameController,
      required this.keyboardType,
      required this.text})
      : super(key: key);
  final TextEditingController nameController;
  final TextInputType keyboardType;
  final String text;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> with Constants  {


  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: TextStyle(color: hintColor,fontSize: 22),

        border: UnderlineInputBorder(borderSide: BorderSide(color:hintColor)),
        contentPadding: const EdgeInsets.all(16),

        suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isSelected=!isSelected;
              });
            }, child: Icon(isSelected?Icons.visibility_rounded:Icons.visibility_off_sharp)),
      ),
    );
  }
}
