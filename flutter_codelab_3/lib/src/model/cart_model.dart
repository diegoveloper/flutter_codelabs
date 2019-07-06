import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'data.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _cartItems = [];
  UnmodifiableListView<Item> get cartItems => UnmodifiableListView(_cartItems);

  double get cartTotal => cartItems.isNotEmpty
      ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2)
      : 0.0;

  addItemToCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  deleteItem(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
