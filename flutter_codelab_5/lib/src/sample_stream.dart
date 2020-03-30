import 'dart:async';

import 'package:flutter/material.dart';

class MyValues {
  final Color color;
  final double value;

  MyValues(this.color, this.value);
}

class MyStream {
  final StreamController<MyValues> _controller = StreamController();
  Stream<MyValues> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }

  void update(double val) {
    _controller.add(
        MyValues(Colors.primaries[val.toInt() % Colors.primaries.length], val));
  }
}

class SampleStream extends StatefulWidget {
  @override
  _SampleStreamState createState() => _SampleStreamState();
}

class _SampleStreamState extends State<SampleStream> {
  final myStream = MyStream();

  @override
  void dispose() {
    myStream.dispose();
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
            title: Text('Stream'),
          ),
          body: StreamBuilder<MyValues>(
            stream: myStream.stream,
            initialData: MyValues(Colors.red, 0.0),
            builder: (context, snapshot) {
              final data = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        width: data.value,
                        color: data.color,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: data.value,
                      onChanged: (val) {
                        myStream.update(val);
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
