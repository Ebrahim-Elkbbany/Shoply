import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/category/view/ui/category.dart';
import 'package:shoply/features/signup-login/models/signup_model.dart';
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
          create: (context) => SignupModel(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Consumer<SignupModel>(
                builder: (context, signModel, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(
                            "Hello!",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 33,
                                fontWeight: FontWeight.w300),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              'assets/images/login.png',
                              width: 250,
                              height: 80,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.black,
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
                                    if (signModel.formKey.currentState!
                                        .validate()) {
                                      await signModel
                                          .login("eyJhbGciOiJIUzI1NiIsInR");
                                      if (signModel.isSignUpSuccessful) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Category()));
                                      }
                                    }
                                  },
                                  child: Text(
                                    "login",
                                    style: TextStyle(color: Colors.white70),
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
