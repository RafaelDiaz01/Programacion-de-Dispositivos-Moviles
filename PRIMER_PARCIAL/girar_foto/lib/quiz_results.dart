import 'package:flutter/material.dart';
import 'package:girar_foto/questions.dart';
// import 'package:girar_foto/main.dart';

class QuizResults extends StatelessWidget {
  const QuizResults({super.key, required this.selectedAnswers, required this.home});
  final List<String> selectedAnswers;
  final void Function() home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(158, 198, 243, 10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Resultados", style: TextStyle(fontSize: 40)),
              SizedBox(height: 20),
              Container(
                color: Color.fromRGBO(255, 255, 255, 10),
                child: Column(
                  children: [
                    Text(
                      "Pregunta 1: ${listQuestions[0].textQuestion}",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Respuesta Correcta: ${listQuestions[0].answers[0]}",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Respuesta Seleccionada: ${selectedAnswers[0]}",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton.icon(
                onPressed: home,
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
