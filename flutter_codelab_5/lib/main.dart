import 'package:flutter/material.dart';
import 'package:flutter_codelab_5/src/sample_changenotifier.dart';
import 'package:flutter_codelab_5/src/sample_stream.dart';
import 'package:flutter_codelab_5/src/sample_valuenotifier.dart';
import 'src/sample_default.dart';
import 'src/sample_statefulbuilder.dart';

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
        title: Text("Best Practices for Rendering"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Sample Default"),
              onPressed: () => _onTap(context, SampleDefault()),
            ),
            RaisedButton(
              child: Text("Sample ValueNotifier"),
              onPressed: () => _onTap(context, SampleValueNotifier()),
            ),
            RaisedButton(
              child: Text("Sample ChangeNotifier"),
              onPressed: () => _onTap(context, SampleChangeNotifier()),
            ),
            RaisedButton(
              child: Text("Sample Stream"),
              onPressed: () => _onTap(context, SampleStreams()),
            ),
            RaisedButton(
              child: Text("Sample StatefulBuilder"),
              onPressed: () => _onTap(context, SampleStatefulBuilder()),
            ),
          ],
        ),
      ),
    );
  }
}
