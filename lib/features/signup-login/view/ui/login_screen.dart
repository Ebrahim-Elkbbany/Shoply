import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/features/signup-login/controllersProvider.dart';
import 'package:shoply/features/signup-login/shared_customs/constants_class.dart';
import 'package:shoply/features/signup-login/shared_customs/custom_button.dart';
import 'package:shoply/features/signup-login/shared_customs/my_text_field.dart';
import 'package:shoply/features/signup-login/shared_customs/password_textfield.dart';

class LoginScreen extends StatelessWidget with Constants {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ChangeNotifierProvider(
          create: (context) => ControllerProvider(),
          child: SingleChildScrollView(
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
                  Consumer<ControllerProvider>(
                    builder: (context, controllerProvider, child) {
                      return Padding(
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
                                  nameController:
                                      controllerProvider.emailController,
                                  text: "Email"),
                              PasswordTextField(
                                  nameController:
                                      controllerProvider.passwordController,
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
