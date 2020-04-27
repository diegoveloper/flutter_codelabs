import 'package:flutter/material.dart';

class ModelNotifier extends ChangeNotifier {
  double value = 0.0;
  Color color = Colors.primaries.first;

  void onUpdate(double val) {
    value = val;
    color = Colors.primaries[val.toInt() % Colors.primaries.length];
    notifyListeners();
  }
}

class SampleChangeNotifier extends StatelessWidget {
  final _modelNotifier = ModelNotifier();

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
          AnimatedBuilder(
              animation: _modelNotifier,
              builder: (context, _) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        color: _modelNotifier.color,
                        width: _modelNotifier.value,
                        height: _modelNotifier.value,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: size.height * .1,
                      height: size.height * .1,
                      child: Slider(
                        value: _modelNotifier.value,
                        onChanged: _modelNotifier.onUpdate,
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
