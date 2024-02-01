import 'package:flutter/material.dart';
import 'package:shoply/features/signup-login/models/signup_model.dart';

class ConfirmFormField extends StatefulWidget {
  final TextEditingController confirmController;

  ConfirmFormField({super.key, required this.confirmController});

  @override
  State<ConfirmFormField> createState() => _ConfirmFormFieldState();
}

class _ConfirmFormFieldState extends State<ConfirmFormField> {
  final SignupModel controllerProvider = SignupModel();
  bool isSelected = false;
  bool isSecured = true;

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
          controller: widget.confirmController,
          obscureText: isSecured,
          decoration: InputDecoration(
            hintText: "Confirm Password",
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
            final originalPassword = SignupModel().passwordController.text;

            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            } else if (value != originalPassword) {
              return 'Confirm password does not match';
            }
            return null;
          },
        ),
      ),
    );
  }
}
