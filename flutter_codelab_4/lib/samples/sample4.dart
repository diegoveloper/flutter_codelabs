import 'package:flutter/material.dart';
import 'package:flutter_codelab_4/data/my_service.dart';
import 'package:flutter_codelab_4/data/person.dart';
//- 4 Change the source when you are in offline mode

class Sample4 extends StatefulWidget {
  @override
  _Sample4State createState() => _Sample4State();
}

class _Sample4State extends State<Sample4> {
  String result = "";
  bool loading = false;
  List<Person> people = List();

  void _onPressed() async {
    setState(() {
      loading = true;
      result = "Start: ${DateTime.now()}";
    });
    people = await MyService().getPeople();
    setState(() {
      loading = false;
      result = result + "\nEnd: ${DateTime.now()}";
    });
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
                                "Get People!",
                                style: Theme.of(context).textTheme.headline,
                              ),
                              onPressed: _onPressed,
                            ),
                            RaisedButton(
                              child: Text(
                                "Clear!",
                                style: Theme.of(context).textTheme.headline,
                              ),
                              onPressed: () {
                                setState(() {
                                  people = List<Person>();
                                  result = "";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.brown.withOpacity(0.5),
                  child: Column(
                    children: [
                      Text(result),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) => ListTile(
                            title: Text(people[index].name),
                          ),
                          itemCount: people.length,
                        ),
                      ),
                    ],
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
