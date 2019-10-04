import 'package:flutter/material.dart';
import 'package:flutter_codelab_4/data/my_service.dart';
import 'package:flutter_codelab_4/data/person.dart';
//- 1 Do not use monotonically increasing document IDs

class Sample1 extends StatefulWidget {
  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  String result = "";
  bool loading = false;
  TextEditingController controllerName = TextEditingController();

  void _onPressed() async {
    if (controllerName.text.trim().isEmpty) return;
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      result = DateTime.now().toIso8601String();
      loading = true;
    });
    final resultId = await MyService().addPerson(Person(controllerName.text));
    result +="\nResult: $resultId";
    controllerName.clear();
    setState(() {
      loading = false;
      result += "\n${DateTime.now().toIso8601String()}";
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
                            TextField(
                              controller: controllerName,
                              decoration: InputDecoration(labelText: "Name"),
                            ),
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
