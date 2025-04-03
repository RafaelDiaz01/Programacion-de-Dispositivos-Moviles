import 'package:flutter/material.dart';
import 'package:primera_aplicacion/my_widget_center.dart';

class MyWiget2 extends StatelessWidget {
  const MyWiget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.3,
          colors: const [
            Color.fromARGB(255, 255, 254, 249),
            Color.fromARGB(255, 252, 191, 25),
          ],
        ),
      ),
      child: MyWidgetCenter(),
    );
  }
}

