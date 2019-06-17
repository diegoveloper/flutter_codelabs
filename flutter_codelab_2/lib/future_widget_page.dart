import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureWidgetPage extends StatelessWidget {
  Future<List> _load() async {
    final response = await http
        .get("http://www.json-generator.com/api/json/get/cfMiozZbQO?indent=2");
    List list = json.decode(response.body);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: FutureBuilder<List>(
        future: _load(),
        builder: (context, snapshot) {
          final localList = snapshot.data;
          return snapshot.hasData
              ? RefreshIndicator(
                  onRefresh: _load,
                  child: ListView.builder(
                    itemCount: localList.length,
                    itemBuilder: (context, index) {
                      final image = localList[index]['image'];
                      return Image.network(image);
                    },
                  ))
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
