import 'package:flutter/material.dart';

class MyWidgetCenter extends StatelessWidget {
  const MyWidgetCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/comp2.jpeg', width: 250),
    );
  }
}
