import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NameFormField extends StatelessWidget {
  final TextEditingController nameController;

  const NameFormField({Key? key, required this.nameController})
      : super(key: key);

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:Colors.white,
        ),
        child: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r"[a-zA-Z]+|\s"),
            )
          ],
          decoration: InputDecoration(
            hintText: "Name",
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter your name';
            } else if (!isValidName) {
              return 'Invalid name format';
            }
            return null;
          },
        ),
      ),
    );
  }
}
