import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/common/data.dart' show Item;
import '../catalog_bloc.dart';
import 'catalog_action_buttons.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen._();

  static BlocProvider init() => BlocProvider<CatalogBloc>(
        create: (_) => CatalogBloc()..add(MyCatalogEventLoad()),
        child: CatalogScreen._(),
      );

  @override
  Widget build(BuildContext context) {
    final CatalogBloc catalogBloc = context.bloc<CatalogBloc>();
    return BlocBuilder<CatalogBloc, List<Item>>(builder: (
      context,
      list,
    ) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            CatalogActionButtons(),
          ],
          title: Text(
            "Catalog",
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                ),
          ),
        ),
        body: catalogBloc.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: catalogBloc.allMyItems.length,
                itemBuilder: (_, index) => CatalogItem(
                  item: catalogBloc.allMyItems[index],
                  wasAdded: catalogBloc.cartItems.contains(
                    catalogBloc.allMyItems[index],
                  ),
                  onTap: () {
                    catalogBloc.add(
                      MyCatalogEventAdd(
                        catalogBloc.allMyItems[index],
                      ),
                    );
                  },
                ),
                separatorBuilder: (_, index) => Divider(),
              ),
      );
    });
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
