import 'package:flutter/material.dart';
import 'my_page1.dart';

class NavigationKeyRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: MyPage1(),
      ),
    );
  }
}
