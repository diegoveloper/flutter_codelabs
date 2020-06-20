import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/common/data.dart';

//states
abstract class CartState {}

class CartEmptyState extends CartState {}

class CartLoadingState extends CartState {}

class CartPushState extends CartState {}

//events
abstract class CartEvent {}

class CartCheckoutEvent extends CartEvent {}

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<Item> cartItems;
  double get cartTotal =>
      cartItems.isNotEmpty ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2) : 0.0;

  CartBloc(this.cartItems);

  @override
  CartState get initialState => CartEmptyState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartCheckoutEvent) {
      yield CartLoadingState();
      await Future.delayed(const Duration(seconds: 2));
      yield CartPushState();
    }
  }
}
