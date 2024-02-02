import 'package:flutter/cupertino.dart';
import 'package:shoply/features/signup-login/models/login_model.dart';
import 'package:shoply/features/signup-login/models/repoModel.dart';
import 'package:shoply/features/signup-login/models/signup_model.dart';

class UserProvider extends ChangeNotifier {
  LoginRepo loginRepo = LoginRepo();
  SignupRepo signupRepo = SignupRepo();
  LoginModel? loginModel = LoginModel();
  SignupModel signupModel = SignupModel();
  List users = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController signPassController = TextEditingController();

  Future SignupUser() async {
    Map<String, dynamic> signupMap = {
      'username': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'confirmPassword': confirmPassController.text,
    };
    signupModel = await signupRepo.SignUp(signupMap);
    notifyListeners();
  }

  Future LoginUser() async {
    Map<String, dynamic> loginMap = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    loginModel = await loginRepo.Login(loginMap);
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
