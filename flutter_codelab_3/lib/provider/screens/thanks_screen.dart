import 'package:flutter/material.dart';
import 'catalog_screen.dart';

class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thanks for buying',
              style: Theme.of(context).textTheme.headline5,
            ),
            FlutterLogo(
              size: 100,
            ),
            RaisedButton(
              child: Text("Go Back"),
              onPressed: () {
                final page = CatalogScreen.init();
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
