import 'package:flutter/material.dart';
import 'package:flutter_codelab_5/navigations/custom/navigation_custom_route.dart';
import 'package:flutter_codelab_5/navigations/default/navigation_default_route.dart';
import 'package:flutter_codelab_5/navigations/key/navigation_key_route.dart';
import 'package:flutter_codelab_5/navigations/named/navigation_named_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _onTap(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => page,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Named Routes"),
              onPressed: () => _onTap(context, NavigationNamedRoute()),
            ),
            RaisedButton(
              child: Text("Default Routes"),
              onPressed: () => _onTap(context, NavigationDefaultRoute()),
            ),
            RaisedButton(
              child: Text("Custom Routes"),
              onPressed: () => _onTap(context, NavigationCustomRoute()),
            ),
            RaisedButton(
              child: Text("Navigation Key"),
              onPressed: () => _onTap(context, NavigationKeyRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
