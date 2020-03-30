import 'dart:async';
import 'package:flutter/material.dart';

class StreamWidgetPage extends StatelessWidget {
  final StreamController<List<String>> _controller = StreamController();

  final List<String> _data = List();

  Stream<List<String>> _streamList() {
    return _controller.stream;
  }

  _addString() {
    _controller.add(_data..add("${_data.length}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _addString();
            },
          )
        ],
      ),
      body: StreamBuilder<List<String>>(
        stream: _streamList(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]),
                    );
                  },
                )
              : Center(
                  child: Text("no data"),
                );
        },
      ),
    );
  }
}
