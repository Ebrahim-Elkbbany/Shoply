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
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController signPassController = TextEditingController();
  TextEditingController addCityController = TextEditingController();
  TextEditingController fNamePassController = TextEditingController();
  TextEditingController lNamePassController = TextEditingController();
  TextEditingController addGeoLatController = TextEditingController();
  TextEditingController addGeoLongController = TextEditingController();
  TextEditingController addStreetController = TextEditingController();
  TextEditingController addNumberController = TextEditingController();
  TextEditingController addZipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController vController = TextEditingController();

  Future SignupUser() async {
    Map<String, dynamic> signupMap = {
      'firstname':fNamePassController.text,
      'lastname':lNamePassController.text,
      'username': userNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'confirmPassword': confirmPassController.text,
      'Address geography lat':addGeoLatController.text,
      'Address geography long':addGeoLongController.text,
      'Address City':addCityController.text,
      'Address Number':addNumberController.text,
      'Address Street':addStreetController.text,
      'Address zip code':addZipCodeController.text,
      'phone':phoneController.text,
      'v':vController.text,
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
    fNamePassController.dispose();
    lNamePassController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    addCityController.dispose();
    addGeoLatController.dispose();
    addStreetController.dispose();
    addGeoLongController.dispose();
    addNumberController.dispose();
    addZipCodeController.dispose();
    phoneController.dispose();
    vController.dispose();

    super.dispose();
  }
}
