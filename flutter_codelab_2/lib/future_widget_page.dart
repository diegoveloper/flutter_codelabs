import 'package:async_widgets/utils.dart';
import 'package:flutter/material.dart';

class FutureWidgetPage extends StatelessWidget {
  Future<List> _load() async {
    List list = await loadData();
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
