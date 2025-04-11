import 'package:flutter/material.dart';
import 'package:primera_aplicacion/my_widget.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor:Color.fromARGB(255, 0, 0, 0),
        body: MyWidget2(Color.fromARGB(255, 255, 254, 249), Color.fromARGB(255, 252, 191, 25)),
      ),
    )
  );
}
