import 'package:flutter/material.dart';
import 'package:girar_foto/questions.dart';
import 'package:girar_foto/quiz_body.dart';
import 'package:girar_foto/quiz_results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /* Widget? currentScreen; Variable de tipo Widget para intercambiar entre pantallas.*/
  String currentScreen = "home-screen";
  final List<String> selectedAnswers = []; // Lista para guardar las respuestas seleccionadas.

  /* Método para darle prioridad a alguna pantalla
  @override
  void initState() {
    currentScreen = MyHomePage(startQuiz: switchScreen);

    super.initState();
  } */

  // Función para actualizar el estado y poder cambiar la pantalla.
  void switchScreen() {
    setState(() {
      currentScreen = "question-screen";
      selectedAnswers.clear();
    });
  }

  void addSelectedAnswer(String answer) {
    selectedAnswers.add(answer);
    //print(selectedAnswers); Imprime en consola la lista de respuestas seleccionadas.
    if (selectedAnswers.length == listQuestions.length) {
      setState(() {
        currentScreen = "home-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = MyHomePage(startQuiz: switchScreen);
    if (currentScreen == "question-screen") {
      screen = QuizBody(addSelectedAnswer: addSelectedAnswer);
    }
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(158, 198, 243, 10),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 241, 213, 10),
            foregroundColor: Color.fromRGBO(0, 0, 0, 10),
            textStyle: TextStyle(fontSize: 25),
            iconSize: 20,
          ),
        ),
      ),
      home: QuizResults(), // screen debe estar
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.startQuiz});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz.png', width: 250),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: startQuiz,
              icon: Icon(Icons.play_circle_fill),
              label: Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
