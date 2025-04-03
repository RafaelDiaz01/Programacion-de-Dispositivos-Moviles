import 'package:flutter/material.dart';

class MyWidgetCenter extends StatelessWidget {
  const MyWidgetCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hi my name is Rafael Díaz",
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
      ),
    );
  }
}