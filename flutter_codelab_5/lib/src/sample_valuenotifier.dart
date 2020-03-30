import 'package:flutter/material.dart';

class SampleValueNotifier extends StatefulWidget {
  @override
  _SampleValueNotifierState createState() => _SampleValueNotifierState();
}

class _SampleValueNotifierState extends State<SampleValueNotifier> {
  final ValueNotifier<double> notifierValue = ValueNotifier(0.0);
  final ValueNotifier<Color> notifierColor = ValueNotifier(Colors.red);

  @override
  void dispose() {
    notifierValue.dispose();
    notifierColor.dispose();
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
            title: Text('ValueNotifier'),
          ),
          body: ValueListenableBuilder(
            builder: (context, value, child) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ValueListenableBuilder(
                        valueListenable: notifierColor,
                        builder: (_, color, __) => Container(
                          width: value,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: value,
                      onChanged: (val) {
                        notifierValue.value = val;
                        notifierColor.value = Colors
                            .primaries[val.toInt() % Colors.primaries.length];
                      },
                      min: 0,
                      max: width,
                    ),
                  ),
                ],
              );
            },
            valueListenable: notifierValue,
          ),
        ),
      ],
    );
  }
}
