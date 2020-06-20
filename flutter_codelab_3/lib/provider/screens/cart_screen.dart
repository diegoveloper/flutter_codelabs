import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/common/data.dart';
import '../cart_provider.dart';
import 'thanks_screen.dart';

class CartScreen extends StatelessWidget {
  CartScreen._();

  static ChangeNotifierProvider init(List<Item> cartItems) => ChangeNotifierProvider<CartProvider>(
        create: (_) => CartProvider(cartItems),
        builder: (_, __) => CartScreen._(),
      );

  void checkoutMyCart(BuildContext context) async {
    final provider = context.read<CartProvider>();
    await provider.checkout();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ThanksScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
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
                for (var item in provider.cartItems)
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
            child: Column(
              children: <Widget>[
                Text(
                  "Total : ${provider.cartTotal}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                if (provider.loading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else if (provider.cartItems.isNotEmpty)
                  RaisedButton(
                    child: Text("Checkout"),
                    onPressed: () {
                      checkoutMyCart(context);
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
