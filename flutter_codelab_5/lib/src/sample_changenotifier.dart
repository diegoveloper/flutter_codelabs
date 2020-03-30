import 'package:flutter/material.dart';

class MyNotifier extends ChangeNotifier {
  Color color = Colors.red;
  double value = 0.0;

  void update(double val) {
    value = val;
    color = Colors.primaries[val.toInt() % Colors.primaries.length];
    notifyListeners();
  }
}

class SampleChangeNotifier extends StatefulWidget {
  @override
  _SampleChangeNotifierState createState() => _SampleChangeNotifierState();
}

class _SampleChangeNotifierState extends State<SampleChangeNotifier> {
  final myNotifier = MyNotifier();

  @override
  void dispose() {
    myNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    print('building...');
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('ChangeNotifier'),
          ),
          body: AnimatedBuilder(
            animation: myNotifier,
            builder: (context, child) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        width: myNotifier.value,
                        color: myNotifier.color,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: myNotifier.value,
                      onChanged: (val) {
                        myNotifier.update(val);
                      },
                      min: 0,
                      max: width,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
