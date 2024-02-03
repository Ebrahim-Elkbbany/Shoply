import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/home/ui/home_view.dart';
import 'package:shoply/features/signup-login/models/userProvider.dart';
import 'package:shoply/features/signup-login/shared_customs/sign_email_formField.dart';
import 'package:shoply/features/signup-login/shared_customs/sign_password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ChangeNotifierProvider(
          create: (context) => UserProvider(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<UserProvider>(
                builder: (context, signModel, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 30, left: 4, right: 4),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          child: Image.asset(
                            'assets/images/login.jpg',
                          ),
                        ),
                      ),
                      const Text(
                        "Hello!",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 26, bottom: 26, left: 8, right: 8),
                        child: Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19)),
                          child: Form(
                            key: signModel.formKey,
                            child: Column(
                              children: [
                                SignEmailField(
                                    controller: signModel.signEmailController),
                                SignPasswordField(
                                  controller: signModel.signPassController,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 180,
                                      height: 100,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Forget Paswword?",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                  ],
                                ),
                                FractionallySizedBox(
                                  widthFactor: .7,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey[900]),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (signModel.formKey.currentState!
                                          .validate()) {
                                        await signModel.LoginUser();

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => HomeView()));
                                      }
                                    },
                                    child: Text(
                                      "login",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
