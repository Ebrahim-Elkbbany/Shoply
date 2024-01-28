import 'package:flutter/material.dart';
import 'package:shoply/features/home/ui/home_view.dart';
import 'package:shoply/features/product/product_details.dart';
import '../../../category/category.dart';
import '../../profile/profile.dart';


class BottomNavLogic  extends ChangeNotifier{
  int currentIndex = 0;
   List<Widget> bottomScreen = [const HomeView(),Category(),const ProductDetails(),Profile()];

  void changeBottomScreen(index) {
    currentIndex = index;
    notifyListeners();
  }

}