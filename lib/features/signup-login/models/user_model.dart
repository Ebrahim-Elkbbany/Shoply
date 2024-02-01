class UserModel {
  final String userName;
  final String email;
  final String password;

  UserModel(
      {required this.userName, required this.email, required this.password});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
        userName: jsonData[' username'],
        email: jsonData['email'],
        password: jsonData['password']);
  }
}
