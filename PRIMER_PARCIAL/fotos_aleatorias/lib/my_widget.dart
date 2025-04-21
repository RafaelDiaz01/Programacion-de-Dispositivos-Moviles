import 'package:flutter/material.dart';
import 'package:girar_dado/my_widget_center.dart';

class MyWidget extends StatelessWidget{
  const MyWidget (this.color1, this.color2, {super.key});
  
  final Color color1;
  final Color color2;
   
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.3,
          colors: [color1, color2],
        ),
      ),
      child: const MyWidgetCenter(), // Quita el parámetro images
    );
  }
}