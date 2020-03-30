import 'package:flutter/material.dart';

class SampleDefault extends StatefulWidget {
  @override
  _SampleDefaultState createState() => _SampleDefaultState();
}

class _SampleDefaultState extends State<SampleDefault> {
  double value = 0.0;

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
            title: Text('Default'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: value,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Slider(
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val;
                    });
                  },
                  min: 0,
                  max: width,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
