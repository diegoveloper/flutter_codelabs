import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_state_management/src/model/cart_model.dart';

import 'cart_total.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.display1.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Consumer<CartModel>(builder: (_, model, __) {
              return ListView(
                padding: EdgeInsets.all(15),
                children: [
                  for (var item in model.cartItems)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '* ${item.name}',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${item.price}',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              model.deleteItem(item);
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              );
            }),
          ),
          Expanded(
            child: CartTotal(),
          ),
        ],
      ),
    );
  }
}
