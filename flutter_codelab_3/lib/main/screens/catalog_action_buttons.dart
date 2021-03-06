import 'package:flutter/material.dart';
import 'package:state_management/common/data.dart';
import 'cart_screen.dart';

class CatalogActionButtons extends StatefulWidget {
  final List<Item> cartItems;
  final VoidCallback onDelete;

  const CatalogActionButtons({
    Key key,
    this.cartItems,
    this.onDelete,
  }) : super(key: key);

  @override
  _CatalogActionButtonsState createState() => _CatalogActionButtonsState();
}

class _CatalogActionButtonsState extends State<CatalogActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.cartItems.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    widget.cartItems.clear();
                  });
                  widget.onDelete();
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final page = CartScreen(cartItems: widget.cartItems);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            ),
            Positioned(
              right: 5.0,
              top: 0.0,
              child: widget.cartItems.isNotEmpty
                  ? CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        widget.cartItems.length.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }
}
