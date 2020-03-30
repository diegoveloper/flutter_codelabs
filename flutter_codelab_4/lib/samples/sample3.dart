import 'package:flutter/material.dart';
import 'package:flutter_codelab_4/data/my_service.dart';
import 'package:flutter_codelab_4/data/person.dart';
//- 3 Do not use `await` for offline mode

class Sample3 extends StatefulWidget {
  @override
  _Sample3State createState() => _Sample3State();
}

class _Sample3State extends State<Sample3> {
  String result = "";
  bool loading = false;
  TextEditingController controllerName = TextEditingController();

  void _onPressed() async {
    if (controllerName.text.trim().isEmpty) return;
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      result = MyService().addPersonOffline(Person(controllerName.text));
    });

    controllerName.clear();
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
