import 'package:flutter/material.dart';
import 'package:shoply/signup-login/shared_customs/constants_class.dart';
import 'package:shoply/signup-login/shared_customs/custom_button.dart';
import 'package:shoply/signup-login/shared_customs/my_text_field.dart';
import 'package:shoply/signup-login/shared_customs/password_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Constants {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Hello!",
                  style: TextStyle(
                      color: deepColor,
                      fontSize: 33,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: deepColor,
                      fontSize: 33,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 26, bottom: 26, left: 8, right: 8),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(19)),
                    child: Column(
                      children: [
                        MyTextField(
                            keyboardType: TextInputType.text,
                            nameController: emailController,
                            text: "Email"),
                        PasswordTextField(
                            nameController: passwordController,
                            keyboardType: TextInputType.text,
                            text: "Password"),
                        Row(
                          children: [
                            const SizedBox(
                              width: 200,
                              height: 100,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Forget Paswword?")),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        CustomButton(button_text: "Sign IN"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
