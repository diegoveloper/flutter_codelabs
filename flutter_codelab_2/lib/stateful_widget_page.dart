import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatefulWidgetPage extends StatefulWidget {
  @override
  _StatefulWidgetPageState createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Widget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 150.0,
              width: 150.0,
              color: _color,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text("Azul"),
                onPressed: () {
                  setState(() {
                    _color = Colors.blue;
                  });
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text("Rojo"),
                onPressed: () {
                  setState(() {
                    _color = Colors.red;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StatefulWidgetPage2 extends StatefulWidget {
  @override
  _StatefulWidgetPage2State createState() => _StatefulWidgetPage2State();
}

class _StatefulWidgetPage2State extends State<StatefulWidgetPage2> {
  List _list = List();
  bool _loading = true;

  _load() async {
    final response = await http
        .get("http://www.json-generator.com/api/json/get/cfMiozZbQO?indent=2");
    setState(() {
      _loading = false;
      _list = json.decode(response.body);
    });
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () {},
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  final image = _list[index]['image'];
                  return Image.network(image);
                },
              )),
    );
  }
}
