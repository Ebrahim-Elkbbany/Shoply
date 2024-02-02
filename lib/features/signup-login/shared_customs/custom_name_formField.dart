import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameFormField extends StatelessWidget {
  final TextEditingController nameController;

  const NameFormField({Key? key, required this.nameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: "Name",
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
      ),
    );
  }
}
