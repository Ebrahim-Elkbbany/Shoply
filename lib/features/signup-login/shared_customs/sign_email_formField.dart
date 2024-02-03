import 'package:flutter/material.dart';

class SignEmailField extends StatelessWidget {
  final TextEditingController controller;
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(controller.text);
  }

  const SignEmailField({super.key, required this.controller});
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
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: "Email"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }else if (!isValidEmail) {
              return 'Invalid email format';
            }
            return null;
          },
        ),
      ),
    );
  }
}
