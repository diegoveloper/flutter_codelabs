import 'package:flutter/material.dart';
import 'package:flutter_codelab_4/data/my_service.dart';
import 'package:flutter_codelab_4/data/person.dart';
//- 2 Do not use multiple single inserts/deletes

class Sample2 extends StatefulWidget {
  @override
  _Sample2State createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  String result = "";
  bool loading = false;

  void _onPressed() async {
    setState(() {
      loading = true;
      result = "Start: ${DateTime.now()}";
    });
    final people = List.generate(NAMES.length, (index) => Person(NAMES[index]));
    await MyService().addPeople(people);
    setState(
      () {
        loading = false;
        result = result + "\nEnd: ${DateTime.now()}";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue.withOpacity(0.5),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              child: Text(
                                "Tap Me!",
                                style: Theme.of(context).textTheme.headline,
                              ),
                              onPressed: _onPressed,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.brown.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      result,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (loading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
