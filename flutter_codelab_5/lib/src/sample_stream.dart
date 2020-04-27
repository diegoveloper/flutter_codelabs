import 'dart:async';
import 'package:flutter/material.dart';

class Holder {
  final double value;
  final Color color;

  Holder({this.value, this.color});
}

class StreamHolder {
  final controller = StreamController<Holder>();
  Stream<Holder> get streamValue => controller.stream;

  void onUpdate(double val) {
    final color = Colors.primaries[val.toInt() % Colors.primaries.length];
    controller.add(Holder(color: color, value: val));
  }

  void dispose() {
    controller.close();
  }
}

class SampleStreams extends StatefulWidget {
  @override
  _SampleStreamsState createState() => _SampleStreamsState();
}

class _SampleStreamsState extends State<SampleStreams> {
  final streamHolder = StreamHolder();

  @override
  void dispose() {
    streamHolder.dispose();
    super.dispose();
  }

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
          StreamBuilder<Holder>(
              stream: streamHolder.streamValue,
              initialData: Holder(color: Colors.primaries.first, value: 0.0),
              builder: (context, snapshot) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        color: snapshot.data.color,
                        width: snapshot.data.value,
                        height: snapshot.data.value,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: size.height * .1,
                      height: size.height * .1,
                      child: Slider(
                        value: snapshot.data.value,
                        onChanged: streamHolder.onUpdate,
                        min: 0.0,
                        max: size.width,
                      ),
                    ),
                  ],
                );
              }),
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
