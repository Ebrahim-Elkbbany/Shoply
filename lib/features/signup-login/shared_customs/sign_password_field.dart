import 'package:flutter/material.dart';

class SignPasswordField extends StatelessWidget {
  final TextEditingController controller;

  const SignPasswordField({super.key, required this.controller});
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
          controller: controller,
          decoration: InputDecoration(hintText: "Password"),
          validator: (value) {

          },
        ),
      ),
    );
  }
}
