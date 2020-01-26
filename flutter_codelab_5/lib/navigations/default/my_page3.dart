import 'package:flutter/material.dart';

class MyPage3 extends StatelessWidget {
  final String myParam;

  const MyPage3({Key key, this.myParam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: Container(
        child: Center(
          child: Text(
            myParam ?? "",
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}
