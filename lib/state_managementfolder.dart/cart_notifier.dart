import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartDetails = [];

  List<Map<String, dynamic>> get cartDetails => _cartDetails;

  void addToCart(Map<String, dynamic> product) {
    // Check if product already exists in cart
    final existingIndex = _cartDetails.indexWhere(
      (item) => item['id'] == product['id'],
    );

    if (existingIndex != -1) {
      // If product exists, update quantity
      _cartDetails[existingIndex]['quantity'] =
          (_cartDetails[existingIndex]['quantity'] ?? 1) + 1;
    } else {
      // If product doesn't exist, add it with quantity 1
      final productWithQuantity = Map<String, dynamic>.from(product);
      productWithQuantity['quantity'] = 1;
      _cartDetails.add(productWithQuantity);
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartDetails.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }
}
