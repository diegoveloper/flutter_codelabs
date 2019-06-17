import 'package:async_widgets/future_widget_page.dart';
import 'package:async_widgets/stateful_widget_page.dart';
import 'package:async_widgets/stream_widget_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  _openPage(Widget widget, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Async Widgets"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyButton(
              label: "Stateful widget 1",
              onTap: () {
                _openPage(StatefulWidgetPage(), context);
              },
            ),
            MyButton(
              label: "Stateful widget 2",
              onTap: () {
                _openPage(StatefulWidgetPage2(), context);
              },
            ),
            MyButton(
              label: "Future Builder",
              onTap: () {
                _openPage(FutureWidgetPage(), context);
              },
            ),
            MyButton(
              label: "Stream Builder",
              onTap: () {
                _openPage(StreamWidgetPage(), context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const MyButton({Key key, this.onTap, this.label = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        child: Text(label),
        color: Colors.red[200],
        onPressed: onTap,
      ),
    );
  }
}
