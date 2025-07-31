import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  final Map<String, int> _counts = {};

  int getCount(String productId) {
    return _counts[productId] ?? 1;
  }

  void increment(String productId) {
    _counts[productId] = getCount(productId) + 1;
    notifyListeners();
  }

  void decrement(String productId) {
    if (getCount(productId) > 1) {
      _counts[productId] = getCount(productId) - 1;
      notifyListeners();
    }
  }
}
