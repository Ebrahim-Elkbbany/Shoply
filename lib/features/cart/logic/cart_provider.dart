import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  int count = 1;
  late double prices;
  double total = 0;

  increase() {
    if(count >= 0) {
      count++;
    }
    notifyListeners();
  }

  decrease() {
    if(count > 1) {
      count--;
    }
    notifyListeners();
  }

  calcTotal(prices) {
    return prices;
    notifyListeners();
  }
}