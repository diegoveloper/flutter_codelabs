import 'dart:convert';

import 'package:devfestlima2018/home_item.dart';
import 'package:devfestlima2018/item_detail.dart';
import 'package:devfestlima2018/lugar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listado = List.generate(20, (index) => "indice $index");
  List listaJSON = List();
  List<Lugar> listaLugares = List();
//factory Lugar.fromJSON(Map<String, dynamic> json) {
  _cargarDatos() async {
    final response = await http
        .get("http://www.json-generator.com/api/json/get/cfMiozZbQO?indent=2");
    listaJSON = json.decode(response.body);

    listaLugares = listaJSON.map((val) => Lugar.fromJSON(val)).toList();

    setState(() {});
  }

  @override
  void initState() {
    _cargarDatos();
    super.initState();
  }

  _onTapLugar(Lugar lugar) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ItemDetailPage(lugar),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("diego@aeyrium.com"),
              accountName: Text("Diego"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("DV"),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Titulo"),
        actions: [
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: () {
              _cargarDatos();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listaLugares.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: listaLugares[index].nombre,
            child: HomeItem(
              lugar: listaLugares[index],
              onTapLugar: () {
                _onTapLugar(listaLugares[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: defaultTargetPlatform == TargetPlatform.iOS
          ? null
          : FloatingActionButton(
              elevation: 5.0,
              onPressed: () {
                setState(() {});
              },
              child: Text("Press"),
            ),
    );
  }
}
