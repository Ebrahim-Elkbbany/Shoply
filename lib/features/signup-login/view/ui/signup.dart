import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/signup-login/controllersProvider.dart';
import 'package:shoply/features/signup-login/shared_customs/custom_button.dart';
import 'package:shoply/features/signup-login/shared_customs/my_text_field.dart';
import 'package:shoply/features/signup-login/shared_customs/password_textfield.dart';
import 'package:shoply/features/signup-login/view/ui/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ChangeNotifierProvider(
        create: (context) => ControllerProvider(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Text(
                    "Welcome",
                    style: TextStyle(color: Colors.black87, fontSize: 33),
                  ),
                ),
                Container(
                  width: 400,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Consumer<ControllerProvider>(
                    builder: (context, controllerProvider, child) {
                      return Column(
                        children: [
                          MyTextField(
                              keyboardType: TextInputType.text,
                              nameController: controllerProvider.nameController,
                              text: "Name"),
                          MyTextField(
                              keyboardType: TextInputType.emailAddress,
                              nameController:
                                  controllerProvider.emailController,
                              text: "Email"),
                          PasswordTextField(
                              nameController:
                                  controllerProvider.passwordController,
                              keyboardType: TextInputType.text,
                              text: "Password"),
                          PasswordTextField(
                              nameController:
                                  controllerProvider.confirmPassController,
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
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Text("SIGN UP"))
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
