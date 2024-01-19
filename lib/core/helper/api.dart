import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  String url = 'https://fakestoreapi.com/';
  Future<dynamic> get(
      {required String endPoint,
       String? token,
      }) async {
    http.Response response = await http.get(Uri.parse('$url$endPoint'));
    return jsonDecode(response.body);
  }

  //Post request methods
  Future<dynamic> post({
    required String endPoint,
    required dynamic body,
    String? token,
  }) async {
    http.Response response =
        await http.post(Uri.parse('$url$endPoint'), body: body);
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

//Put request methods
  Future<dynamic> put({
    required String endPoint,
    required dynamic body,
    String? token,
  }) async {
    http.Response response = await http.put(
      Uri.parse('$url$endPoint'),
      body: body,
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
