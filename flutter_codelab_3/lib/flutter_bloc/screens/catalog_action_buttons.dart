import 'package:flutter/material.dart';
import 'package:state_management/flutter_bloc/catalog_bloc.dart';
import 'cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CatalogBloc catalogBloc = context.bloc<CatalogBloc>();
    return Row(
      children: [
        catalogBloc.cartItems.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  catalogBloc.add(MyCatalogDeleteEvent());
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final page = CartScreen.init(catalogBloc.cartItems);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            ),
            Positioned(
              right: 5.0,
              top: 0.0,
              child: catalogBloc.cartItems.isNotEmpty
                  ? CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        catalogBloc.cartItems.length.toString(),
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
