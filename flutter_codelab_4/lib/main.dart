import 'package:flutter/material.dart';
import 'samples/sample1.dart';
import 'samples/sample2.dart';
import 'samples/sample3.dart';
import 'samples/sample4.dart';
import 'samples/sample5.dart';
import 'samples/sample6.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
- 1 Do not use monotonically increasing document IDs 
- 2 Do not use multiple single inserts/deletes
- 3 Do not use `await` for offline mode
- 4 Change the source when you are in offline mode
- 5 Paginate your api-calls when you have a lot of data
- 6 Listen for realtime changes for not heavy data
*/

class _MyHomePageState extends State<MyHomePage> {
  void _goToNextPage(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Best Practices"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          MyHomeButton(
            title: "Sample 1",
            description: "Do not use monotonically increasing document IDs",
            onTap: () => _goToNextPage(Sample1()),
          ),
          MyHomeButton(
            title: "Sample 2",
            description: "Do not use multiple single inserts/deletes",
            onTap: () => _goToNextPage(Sample2()),
          ),
          MyHomeButton(
            title: "Sample 3",
            description: "Do not use `await` for offline mode",
            onTap: () => _goToNextPage(Sample3()),
          ),
          MyHomeButton(
            title: "Sample 4",
            description: "Change the source when you are in offline mode",
            onTap: () => _goToNextPage(Sample4()),
          ),
          MyHomeButton(
            title: "Sample 5",
            description: "Paginate your api-calls when you have a lot of data",
            onTap: () => _goToNextPage(Sample5()),
          ),
          MyHomeButton(
            title: "Sample 6",
            description: "Listen for realtime changes for not heavy data",
            onTap: () => _goToNextPage(Sample6()),
          ),
        ],
      ),
    );
  }
}

class MyHomeButton extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool visible;

  const MyHomeButton({
    Key key,
    this.title,
    this.onTap,
    this.description,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(title ?? ""),
                  subtitle: Text(description ?? ""),
                ),
              ),
              onPressed: onTap,
            ),
          )
        : const SizedBox.shrink();
  }
}
