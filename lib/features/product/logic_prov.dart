import 'package:flutter/cupertino.dart';

class help extends ChangeNotifier {
  int count = 0;

  increase() {
    count++;
    notifyListeners();
  }

  decrease() {
    count--;
    notifyListeners();
  }
}
