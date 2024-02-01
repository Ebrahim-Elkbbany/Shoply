import 'package:flutter/material.dart';

import 'package:shoply/features/signup-login/models/signup_model.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController passController;

  const PasswordFormField({Key? key, required this.passController})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isSelected = false;
  bool isSecured = true;
  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#><*~]).{8,}$');
    return passwordRegExp.hasMatch(SignupModel().passwordController.text);
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
          color: Colors.white,
        ),
        child: TextFormField(
          controller: widget.passController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: isSecured,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    isSecured = !isSecured;
                  });
                },
                child: Icon(isSelected
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_sharp)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (!isValidPassword) {
              return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
            }
            return null;
          },
        ),
      ),
    );
  }
}
