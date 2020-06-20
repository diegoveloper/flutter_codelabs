import 'package:flutter/foundation.dart';
import 'package:state_management/common/data.dart';

class CartProvider extends ChangeNotifier {
  bool loading = false;
  final List<Item> cartItems;
  double get cartTotal =>
      cartItems.isNotEmpty ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2) : 0.0;

  CartProvider(this.cartItems);

  Future<void> checkout() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    notifyListeners();
  }
}
