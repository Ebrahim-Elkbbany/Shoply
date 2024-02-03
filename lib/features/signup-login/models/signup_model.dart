class SignupModel {
  final String? userName;
  final String? email;
  final String? password;
  final String? phone;
  final String? fName;
  final String? lName;
  final String? addGeoLat;
  final String? addGeoLong;
  final String? addCity;
  final String? addStreet;
  final String? addNumber;
  final String? addZipCode;
  final String? v;

  SignupModel({
    this.userName,
    this.email,
    this.password,
    this.phone,
    this.fName,
    this.lName,
    this.addGeoLat,
    this.addGeoLong,
    this.addCity,
    this.addStreet,
    this.addNumber,
    this.addZipCode,
    this.v,
  });

  factory SignupModel.fromJson(jsonData) {
    return SignupModel(
        email: jsonData['email'],
        userName: jsonData[' username'],
        password: jsonData['password'],
        fName: jsonData['name']['firstname'],
        lName: jsonData['name']['lastname'],
        phone: jsonData['phone'],
        v: jsonData['__v']);
  }
  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['name']['firstname'] = fName;
    data['name']['lastname'] = lName;
    data['phone'] = password;
    data['__v'] = v;

    return data;
  }
}
