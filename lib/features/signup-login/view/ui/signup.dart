import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/layout/layout_view.dart';
import 'package:shoply/features/signup-login/models/userProvider.dart';
import 'package:shoply/features/signup-login/shared_customs/confirm_password_formField.dart';
import 'package:shoply/features/signup-login/shared_customs/custom_email_formField.dart';
import 'package:shoply/features/signup-login/shared_customs/custom_form_field.dart';
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
          child: Consumer<UserProvider>(
            builder: (context, signupModel, child) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 22, left: 16, bottom: 16, right: 16),
                child: Form(
                  key: signupModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 80,
                          width: 200,
                          child: Image.asset(
                            'assets/images/signup.png',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Welcome ..",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 33,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView(
                        children: [
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
                                Row(
                                  children: [
                                    CustomFormField(
                                        controller: signupModel.fNamePassController,
                                        hintText: "First Name",
                                        keyboardType: TextInputType.name),
                                    CustomFormField(
                                        controller: signupModel.lNamePassController,
                                        hintText: "Last Name",
                                        keyboardType: TextInputType.name),
                                  ],
                                ),
                                CustomFormField(
                                    controller: signupModel.userNameController,
                                    hintText: "user name",
                                    keyboardType: TextInputType.text),

                                EmailFormField(
                                    emailController:
                                        signupModel.emailController),
                                PasswordFormField(
                                    passController:
                                        signupModel.passwordController),
                                ConfirmFormField(
                                    confirmController:
                                        signupModel.confirmPassController),
                               Row(
                                 children: [
                                   CustomFormField(
                                       controller: signupModel.addGeoLatController,
                                       hintText: "Address geography lat",
                                       keyboardType: TextInputType.text),
                                   CustomFormField(
                                       controller:
                                       signupModel.addGeoLongController,
                                       hintText: "Address geography long",
                                       keyboardType: TextInputType.text),
                                 ],
                               ),
                               Row(
                                 children: [
                                   CustomFormField(
                                       controller: signupModel.addCityController,
                                       hintText: "Address City",
                                       keyboardType: TextInputType.text),
                                   CustomFormField(
                                       controller: signupModel.addStreetController,
                                       hintText: 'Address street',
                                       keyboardType: TextInputType.text),
                                 ],
                               ),
                               Row(
                                 children: [
                                   CustomFormField(
                                       controller: signupModel.addNumberController,
                                       hintText: "Address Number",
                                       keyboardType: TextInputType.text),
                                   CustomFormField(
                                       controller:
                                       signupModel.addZipCodeController,
                                       hintText: "Address Zip Code",
                                       keyboardType: TextInputType.number),
                                 ],
                               ),
                               Row(
                                 children: [
                                   CustomFormField(
                                       controller: signupModel.phoneController,
                                       hintText: "phone ",
                                       keyboardType: TextInputType.number),
                                   CustomFormField(
                                       controller: signupModel.vController,
                                       hintText: "__v",
                                       keyboardType: TextInputType.number),
                                 ],
                               )

                              ],
                            ),
                          ),
                        ],
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey[900]),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (signupModel.formKey.currentState!.validate()) {
                              await signupModel.SignupUser();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LayoutView()));

                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: Text(
                            "SignUp ",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              "Already Have Account?",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
