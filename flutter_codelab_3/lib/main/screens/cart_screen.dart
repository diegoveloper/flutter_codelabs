import 'package:flutter/material.dart';
import 'package:state_management/main/model/data.dart';
import 'package:state_management/main/screens/thanks_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Item> cartItems;

  const CartScreen({Key key, this.cartItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool loading = false;

  double get cartTotal =>
      widget.cartItems.isNotEmpty ? widget.cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2) : 0.0;

  void _checkout() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ThanksScreen(),
      ),
    );
  }

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
                for (var item in widget.cartItems)
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
                  "Total : $cartTotal",
                  style: Theme.of(context).textTheme.headline2,
                ),
                if (loading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else if (widget.cartItems.isNotEmpty)
                  RaisedButton(
                    child: Text("Checkout"),
                    onPressed: _checkout,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
