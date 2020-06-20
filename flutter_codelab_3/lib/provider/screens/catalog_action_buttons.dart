import 'package:flutter/material.dart';
import 'package:state_management/provider/catalog_provider.dart';
import 'cart_screen.dart';
import 'package:provider/provider.dart';

class CatalogActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatalogProvider>(context, listen: false);
    return Row(
      children: [
        provider.cartItems.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.deleteAll();
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final page = CartScreen.init(provider.cartItems);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            ),
            Positioned(
              right: 5.0,
              top: 0.0,
              child: provider.cartItems.isNotEmpty
                  ? CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        provider.cartItems.length.toString(),
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
