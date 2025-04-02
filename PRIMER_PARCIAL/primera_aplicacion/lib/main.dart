import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), //
        body: MyWiget2(),
      ),
    )
  );
}

class MyWiget2 extends StatelessWidget {
  const MyWiget2({
    super.key,
  });

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
          child: const Center(
    child: Text(
      "Hi my name is Rafael Díaz",
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
    ),
          ),
          );
  }
}