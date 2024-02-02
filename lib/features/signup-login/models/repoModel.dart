import 'package:http/http.dart';
import 'package:shoply/core/helper/api.dart';
import 'package:shoply/core/utils/end_points.dart';
import 'package:shoply/features/signup-login/models/signup_model.dart';

class LoginRepo {
  Future Login(Map<dynamic, dynamic> data) async {
    try {
      Response response =
          await ApiHelper().post(endPoint: EndPoints.signin, body: data);
      return SignupModel.fromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}

class SignupRepo {
  Future SignUp(Map<dynamic, dynamic> data) async {
    try {
      Response response =
          await ApiHelper().post(endPoint: EndPoints.signup, body: data);
      return SignupModel.fromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
