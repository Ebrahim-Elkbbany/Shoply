class LoginModel {
  final String? userName;
  final String? email;
  final String? password;
  final String? token;

  LoginModel({
   this.userName,
 this.email,
    this.password,
     this.token,
  });

  factory LoginModel.fromJson(jsonData) {
    return LoginModel(
        userName: jsonData[' username'],
        email: jsonData['email'],
        password: jsonData['password'],
        token: jsonData['token']);
  }
  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}
