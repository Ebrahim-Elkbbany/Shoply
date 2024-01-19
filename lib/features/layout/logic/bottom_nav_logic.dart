import 'package:flutter/material.dart';
import 'package:shoply/features/home/ui/home_view.dart';


class BottomNavLogic  extends ChangeNotifier{
  int currentIndex = 0;
   List<Widget> bottomScreen = [const HomeView()];

  void changeBottomScreen(index) {
    currentIndex = index;
    notifyListeners();
  }

}