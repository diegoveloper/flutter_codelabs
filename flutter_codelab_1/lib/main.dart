import 'package:devfestlima2018/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class MiBoton extends StatelessWidget {
  final String titulo;
  final Color color;

  MiBoton({this.titulo, this.color = Colors.brown});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0),
      child: RaisedButton(
        color: color,
        onPressed: () {
          print("Titulo: $titulo");
        },
        child: Text(titulo),
      ),
    );
  }
}
