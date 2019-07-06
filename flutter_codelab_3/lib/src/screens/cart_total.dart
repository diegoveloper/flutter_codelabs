import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_state_management/src/model/cart_model.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (_, model, __) {
        return Text(
          "Total : ${model.cartTotal}",
          style: Theme.of(context).textTheme.display3,
        );
      },
    );
  }
}
