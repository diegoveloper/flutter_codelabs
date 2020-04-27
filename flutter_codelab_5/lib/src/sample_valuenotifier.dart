import 'package:flutter/material.dart';

class SampleValueNotifier extends StatelessWidget {
  final _valueNotifier = ValueNotifier(0.0);

  void _onChange(double val) {
    _valueNotifier.value = val;
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
          ValueListenableBuilder<double>(
              valueListenable: _valueNotifier,
              builder: (context, snapshot, _) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        color: Colors.primaries[
                            snapshot.toInt() % Colors.primaries.length],
                        width: snapshot,
                        height: snapshot,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: size.height * .1,
                      height: size.height * .1,
                      child: Slider(
                        value: snapshot,
                        onChanged: _onChange,
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
