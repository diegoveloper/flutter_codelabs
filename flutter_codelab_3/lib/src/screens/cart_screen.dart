import 'package:flutter/material.dart';
import 'package:sample_state_management/src/model/data.dart';

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
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                for (var item in items)
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
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            child: Text("footer"),
          ),
        ],
      ),
    );
  }
}
