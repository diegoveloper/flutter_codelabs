import 'package:flutter/material.dart';
import 'package:state_management/main/model/data.dart';

class CartScreen extends StatelessWidget {
  final List<Item> cartItems;

  const CartScreen({Key key, this.cartItems}) : super(key: key);

  double get cartTotal => cartItems.isNotEmpty
      ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2)
      : 0.0;

  @override
  Widget build(BuildContext context) {
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
                for (var item in cartItems)
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
            child: Text(
              "Total : $cartTotal",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
