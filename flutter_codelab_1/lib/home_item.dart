import 'package:devfestlima2018/lugar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeItem extends StatelessWidget {
  final Lugar lugar;
  final VoidCallback onTapLugar;
  HomeItem({this.lugar, this.onTapLugar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapLugar,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: lugar.imagen,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5.0),
              color: Colors.black.withOpacity(0.5),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  lugar.nombre,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
