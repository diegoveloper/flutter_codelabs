import 'package:flutter/material.dart';
import 'my_page2.dart';

class MyPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: FlutterLogo(
                size: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text("Push Route 2"),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text("Replace Route 2"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
