import 'package:flutter/material.dart';
import 'package:state_management/common/data.dart';

class CatalogProvider extends ChangeNotifier {
  final List<Item> cartItems = [];
  List<Item> allMyItems = [];
  bool loading = false;

  void loadData() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    allMyItems.clear();
    allMyItems.addAll(allItems);

    loading = false;
    notifyListeners();
  }

  void addItem(Item item) {
    cartItems.add(item);
    notifyListeners();
  }

  void deleteAll() {
    cartItems.clear();
    notifyListeners();
  }
}
