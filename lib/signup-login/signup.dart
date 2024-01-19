import 'package:flutter/material.dart';

import 'package:shoply/signup-login/login_screen.dart';
import 'package:shoply/signup-login/shared_customs/constants_class.dart';
import 'package:shoply/signup-login/shared_customs/custom_button.dart';
import 'package:shoply/signup-login/shared_customs/my_text_field.dart';
import 'package:shoply/signup-login/shared_customs/password_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>  with Constants{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(color: deepColor,fontSize: 33),
                ),
              ),
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Column(
                  children: [
                    MyTextField(
                        keyboardType: TextInputType.text,
                        nameController: nameController,
                        text: "Name"),
                    MyTextField(
                        keyboardType: TextInputType.emailAddress,
                        nameController: emailController,
                        text: "Email"),
                    PasswordTextField(
                        nameController: passwordController,
                        keyboardType: TextInputType.text,
                        text: "Password"),
                    PasswordTextField(
                        nameController: confirmPassController,
                        keyboardType: TextInputType.text,
                        text: "Confirm Password"),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomButton(button_text: "Login"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text("Already Have Account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text("SIGN UP"))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
