import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoply/core/helper/api.dart';
import 'package:shoply/core/utils/end_points.dart';
import 'package:shoply/features/home/models/products_model.dart';

class HomeServiceProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<String> categoryList = [];
  Future<void> getAllProduct() async {
    List<dynamic> data = await ApiHelper().get(endPoint: EndPoints.product);
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
      notifyListeners();
    }
  }

  Future<void> getAllCategory() async {
    List<dynamic> data = await ApiHelper().get(endPoint: EndPoints.category);

    for (int i = 0; i < data.length; i++) {
      categoryList.add(data[i]);
      notifyListeners();
    }
  }
}
