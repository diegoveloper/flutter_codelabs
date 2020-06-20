import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/common/data.dart';

enum CartAction { checkout }

class CartBloc extends Bloc<CartAction, int> {
  bool loading = false;
  final List<Item> cartItems;
  double get cartTotal =>
      cartItems.isNotEmpty ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2) : 0.0;

  CartBloc(this.cartItems);

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CartAction event) async* {
    if (event == CartAction.checkout) {
      loading = true;
      yield 1;

      await Future.delayed(const Duration(seconds: 2));

      loading = false;
      yield 2;
    }
  }
}
