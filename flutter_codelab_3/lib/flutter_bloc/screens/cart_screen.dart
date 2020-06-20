import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/common/data.dart';
import 'package:state_management/flutter_bloc/cart_bloc.dart';
import 'thanks_screen.dart';

class CartScreen extends StatelessWidget {
  CartScreen._();

  static BlocProvider init(List<Item> items) => BlocProvider<CartBloc>(
        create: (_) => CartBloc(items),
        child: CartScreen._(),
      );

  void checkoutMyCart(BuildContext context) async {
    final CartBloc cartBloc = context.bloc<CartBloc>();
    cartBloc.add(CartCheckoutEvent());
  }

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = context.bloc<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                for (var item in cartBloc.cartItems)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '* ${item.name}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${item.price}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            child: BlocListener<CartBloc, CartState>(
              bloc: cartBloc,
              listener: (context, state) {
                if (state is CartPushState) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => ThanksScreen(),
                    ),
                  );
                }
              },
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Total : ${cartBloc.cartTotal}",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      if (state is CartLoadingState)
                        Center(
                          child: CircularProgressIndicator(),
                        )
                      else if (cartBloc.cartItems.isNotEmpty)
                        RaisedButton(
                          child: Text("Checkout"),
                          onPressed: () {
                            checkoutMyCart(context);
                          },
                        )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
