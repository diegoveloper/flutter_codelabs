import 'package:devfestlima2018/home_item.dart';
import 'package:devfestlima2018/lugar.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final Lugar lugar;

  ItemDetailPage(this.lugar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lugar.nombre),
      ),
      body: Column(
        children: [
          Hero(
            tag: lugar.nombre,
            child: HomeItem(
              lugar: lugar,
              onTapLugar: () {},
            ),
          ),
          Text(lugar.descripcion),
        ],
      ),
    );
  }
}
