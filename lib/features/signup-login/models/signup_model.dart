import 'package:flutter/cupertino.dart';
import 'package:shoply/core/helper/api.dart';
import 'package:shoply/core/utils/end_points.dart';

class SignupModel extends ChangeNotifier {
  bool isSignUpSuccessful = false;
  List users = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController signPassController = TextEditingController();

  Future<void> signUpAndLogin() async {
    if (formKey.currentState!.validate()) {
      final Map<String, dynamic> signupData = {
        'username': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };

      try {
        final response = await ApiHelper().post(
          endPoint: EndPoints.signup,
          body: signupData,
        );

        if (response['token'] != null) {
          await login(response['token']);
          isSignUpSuccessful = true;
        } else {
          print('Signup failed. Token not received.');
          isSignUpSuccessful = false;
        }
      } catch (e) {
        print('Error during signup: $e');
        isSignUpSuccessful = false;
      }
      notifyListeners();
    }
  }

  Future<void> login(String token) async {
    final Map<String, dynamic> loginData = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      final response = await ApiHelper().post(
        endPoint: EndPoints.signin,
        body: loginData,
      );

      if (response['success'] == true) {
        print('Login successful!');
      } else {
        print('Login failed.');
      }
    } catch (e) {
      print('Error during login: $e');
    }
    notifyListeners();
  }
}
