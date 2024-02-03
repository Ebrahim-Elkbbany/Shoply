import 'package:flutter/material.dart';
import 'package:shoply/features/cart/ui/cart.dart';
import 'package:shoply/features/category/view/ui/category.dart';
import 'package:shoply/features/home/ui/home_view.dart';
import '../../profile/profile.dart';


class BottomNavLogic  extends ChangeNotifier{
  int currentIndex = 0;
   List<Widget> bottomScreen = [const HomeView(),Category(),Cart(),ProfileView()];

  void changeBottomScreen(index) {
    currentIndex = index;
    notifyListeners();
  }

}