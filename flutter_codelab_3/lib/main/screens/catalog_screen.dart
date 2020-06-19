import 'package:flutter/material.dart';
import 'package:state_management/main/model/data.dart' show Item, allItems;
import 'package:state_management/main/screens/catalog_action_buttons.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Item> cartItems = [];
  List<Item> allMyItems = [];
  bool loading = false;

  void _loadData() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    allMyItems.clear();
    allMyItems.addAll(allItems);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CatalogActionButtons(
            cartItems: cartItems,
          ),
        ],
        title: Text(
          "Catalog",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: allMyItems.length,
              itemBuilder: (_, index) => CatalogItem(
                item: allMyItems[index],
                wasAdded: cartItems.contains(
                  allMyItems[index],
                ),
                onTap: () {
                  setState(() {
                    cartItems.add(
                      allMyItems[index],
                    );
                  });
                },
              ),
              separatorBuilder: (_, index) => Divider(),
            ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final bool wasAdded;
  const CatalogItem({
    Key key,
    this.item,
    this.onTap,
    this.wasAdded,
  }) : super(key: key);

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
      trailing: !wasAdded
          ? OutlineButton(
              child: Text("ADD"),
              onPressed: onTap,
            )
          : Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.check),
            ),
    );
  }
}
