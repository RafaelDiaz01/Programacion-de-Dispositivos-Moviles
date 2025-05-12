// Kevin Rafael Díaz López - 08/05/2024
// Archivo principal de la aplicación QuizApp.

import 'package:flutter/material.dart';
import 'package:girar_foto/questions.dart';
import 'package:girar_foto/quiz_body.dart';
import 'package:girar_foto/quiz_results.dart';

void main() { 
  runApp(MyApp());
}

// Clase principal de la aplicación.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(); // Estado de la aplicación, ya que es StatefulWidget.
}

class _MyAppState extends State<MyApp> {
  String currentScreen = "home-screen"; // Guardamos en un String la palabra que utilizamos para ir a la pantalla inicial de la aplicación.
  final List<String> selectedAnswers = []; // Lista para guardar las respuestas seleccionadas.

  // Función para actualizar el estado y poder cambiar la pantalla.
  void switchScreen() {
    setState(() {
      currentScreen = "question-screen"; // Pantalla de preguntas.
      selectedAnswers.clear(); // Reiniciamos la lista de respuestas seleccionadas.
      // Esto es para que al regresar a la pantalla de preguntas, se reinicie la lista de respuestas seleccionadas.
    });
  }

  // Función para agregar la respuesta seleccionada a la lista de respuestas.
  // Esta función se pasa como parámetro a la pantalla de preguntas.
  void addSelectedAnswer(String answer) {
    selectedAnswers.add(answer); // Agregamos la respuesta seleccionada a la lista de respuestas.
    if (selectedAnswers.length == listQuestions.length) { // Si la longitud de la lista de respuestas es igual a la longitud de la lista de preguntas, significa que ya se respondieron todas las preguntas.
      // Entonces cambiamos la pantalla a la pantalla de resultados.
      setState(() {
        currentScreen = "results-screen"; // Pantalla de resultados.
      });
    }
  }

  // Función para regresar al inicio del Quiz.
  void home(){
    setState(() {
      currentScreen = "home-screen"; // Pantalla de inicio.
      selectedAnswers.clear(); // Reiniciamos la lista de respuestas seleccionadas.
    });
  }

  // Método build que construye la interfaz de la aplicación.
  // Este método se llama cada vez que se actualiza el estado de la aplicación.
  // En nuestro caso, se llama cada vez que se cambia la pantalla.
  @override
  Widget build(BuildContext context) {

    Widget screen = MyHomePage(startQuiz: switchScreen);     // Variable que guarda la pantalla que se va a mostrar, dependiendo del valor de currentScreen, se mostrará una pantalla u otra.
    
    if (currentScreen == "question-screen") { // Si la pantalla actual es la de preguntas, entonces se muestra la pantalla de preguntas.
      // Se pasa la función addSelectedAnswer como parámetro a la pantalla de preguntas.
      // Esta función se utiliza para agregar la respuesta seleccionada a la lista de respuestas.
      screen = QuizBody(addSelectedAnswer: addSelectedAnswer);
    } 

    if (currentScreen == "results-screen") {
      screen = QuizResults(selectedAnswers: selectedAnswers, home: home,);
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
      home: screen,
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
