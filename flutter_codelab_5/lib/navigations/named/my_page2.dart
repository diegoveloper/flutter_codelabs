import 'package:flutter/material.dart';
import 'my_page3.dart';

class MyPage2 extends StatelessWidget {
  final String myParam;

  const MyPage2({Key key, this.myParam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          title: Text("Page 2"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    myParam ?? "",
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.redAccent,
                        child: Text("Push Named Route 3"),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.redAccent,
                        child: Text("Replace Named\nRoute 3"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
