import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/category/view/ui/category.dart';
import 'package:shoply/features/signup-login/models/userProvider.dart';
import 'package:shoply/features/signup-login/shared_customs/confirm_password_formField.dart';
import 'package:shoply/features/signup-login/shared_customs/custom_email_formField.dart';
import 'package:shoply/features/signup-login/shared_customs/custom_name_formField.dart';
import 'package:shoply/features/signup-login/shared_customs/password_formField.dart';
import 'package:shoply/features/signup-login/view/ui/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ChangeNotifierProvider(
          create: (context) => UserProvider(),
          child: SingleChildScrollView(
            child: Consumer<UserProvider>(
              builder: (context, signupModel, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: signupModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 26, bottom: 22, left: 16, right: 16),
                          child: Row(
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 33),
                              ),
                              SizedBox(
                                height: 80,
                                width: 200,
                                child: Image.asset(
                                  'assets/images/signup.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 400,
                            height: 600,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 70,
                                ),
                                NameFormField(
                                    nameController: signupModel.nameController),
                                EmailFormField(
                                    emailController:
                                        signupModel.emailController),
                                PasswordFormField(
                                    passController:
                                        signupModel.passwordController),
                                ConfirmFormField(
                                    confirmController:
                                        signupModel.confirmPassController),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.grey[900]),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(17),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (signupModel.formKey.currentState!
                                        .validate()) {
                                      await signupModel.SignupUser();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Category()));
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                  child: Text(
                                    "login",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
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
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
