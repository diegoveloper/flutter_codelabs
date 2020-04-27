import 'package:flutter/material.dart';

class SampleStatefulBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("build $this ${DateTime.now()}");
    double value = 0.0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackgroundWidget(),
          ),
          StatefulBuilder(builder: (context, updateState) {
            return Stack(
              children: [
                Center(
                  child: Container(
                    color: Colors
                        .primaries[value.toInt() % Colors.primaries.length],
                    width: value,
                    height: value,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: size.height * .1,
                  height: size.height * .1,
                  child: Slider(
                    value: value,
                    onChanged: (val) {
                      updateState(() {
                        value = val;
                      });
                    },
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
