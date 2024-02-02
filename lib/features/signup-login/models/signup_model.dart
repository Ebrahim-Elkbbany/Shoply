class SignupModel {
  final String? userName;
  final String? email;
  final String? password;

  SignupModel({this.userName, this.email, this.password});

  factory SignupModel.fromJson(jsonData) {
    return SignupModel(
        userName: jsonData[' username'],
        email: jsonData['email'],
        password: jsonData['password']);
  }
  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
