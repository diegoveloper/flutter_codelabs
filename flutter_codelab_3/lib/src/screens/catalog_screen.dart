import 'package:flutter/material.dart';
import 'package:sample_state_management/src/model/data.dart';
import 'package:sample_state_management/src/screens/cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              final page = CartScreen();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => page),
              );
            },
          ),
        ],
        title: Text(
          "Catalog",
          style: Theme.of(context).textTheme.display1.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
        ),
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (_, index) => CatalogItem(
          item: items[index],
        ),
        separatorBuilder: (_, index) => Divider(),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Container(
        height: 50,
        width: 50,
        color: item.color,
      ),
      title: Text(item.name),
      subtitle: Text("\$${item.price}"),
      trailing: item.id.isEven
          ? OutlineButton(
              child: Text("ADD"),
              onPressed: () => null,
            )
          : Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.check),
            ),
    );
  }
}
