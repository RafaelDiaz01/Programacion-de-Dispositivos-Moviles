import 'package:flutter/material.dart';

class QuizResults extends StatelessWidget {
  const QuizResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(158, 198, 243, 10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Resultados"), SizedBox(height: 20), Container(color: Color.fromRGBO(255, 255, 255, 10),)],
          ),
        ),
      ),
    );
  }
}
