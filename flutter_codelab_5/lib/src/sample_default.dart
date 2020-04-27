import 'package:flutter/material.dart';

class SampleDefault extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<SampleDefault> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("build $this ${DateTime.now()}");
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackgroundWidget(),
          ),
          Center(
            child: Container(
              color: Colors.primaries[_value.toInt() % Colors.primaries.length],
              width: _value,
              height: _value,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * .1,
            height: size.height * .1,
            child: Slider(
              value: _value,
              onChanged: (val) {
                setState(() {
                  _value = val;
                });
              },
              min: 0.0,
              max: size.width,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build $this ${DateTime.now()}");
    return Image.network(
      'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg',
      fit: BoxFit.cover,
    );
  }
}
