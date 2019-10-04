import 'package:flutter/material.dart';
import 'package:flutter_codelab_4/data/my_service.dart';
import 'package:flutter_codelab_4/data/person.dart';
//- 6 Listen for realtime changes for not heavy data

class Sample6 extends StatefulWidget {
  @override
  _Sample6State createState() => _Sample6State();
}

class _Sample6State extends State<Sample6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<Person>>(
        stream: MyService().getPeopleStream(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return snapshot.hasData
              ? Container(
                  color: Colors.brown.withOpacity(0.5),
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => ListTile(
                      title: Text("$index => ${data[index].name}"),
                    ),
                    itemCount: data.length,
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
