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

    if (currentScreen == "results-screen") { // Si la pantalla actual es la de resultados, entonces se muestra la pantalla de resultados.
      screen = QuizResults(selectedAnswers: selectedAnswers, home: home,);
      // Se pasa la lista de respuestas seleccionadas y la función home como parámetros a la pantalla de resultados.
      // La función home se utiliza para regresar a la pantalla de inicio.
    }
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData( // Tema de la aplicación.
        scaffoldBackgroundColor: Color.fromRGBO(158, 198, 243, 10),
        elevatedButtonTheme: ElevatedButtonThemeData( // Tema de los botones elevados.
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 241, 213, 10),
            foregroundColor: Color.fromRGBO(0, 0, 0, 10),
            textStyle: TextStyle(fontSize: 25),
            iconSize: 20, // Tamaño del icono del botón.
          ),
        ),
      ),
      home: screen, // Pantalla que se va a mostrar, dependiendo del valor de currentScreen.
      // Si el valor de currentScreen es "home-screen", se mostrará la pantalla de inicio.
      // Si el valor de currentScreen es "question-screen", se mostrará la pantalla de preguntas.
      // Si el valor de currentScreen es "results-screen", se mostrará la pantalla de resultados.
      // En este caso, se mostrará la pantalla de inicio.
    );
  }
}

// Pantalla de inicio de la aplicación.
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.startQuiz}); // Constructor de la pantalla de inicio.

  // Esta pantalla recibe una función como parámetro, que se utiliza para cambiar la pantalla a la de preguntas.
  // Esta función se pasa como parámetro desde la clase MyApp.
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {  // Método build que construye la interfaz de la pantalla de inicio.
    return Scaffold(
      body: Center( // Centro de la pantalla.
        // El widget Center centra su hijo en la pantalla.
        child: Column( // Columna que contiene los widgets de la pantalla de inicio.
          mainAxisAlignment: MainAxisAlignment.center, // Alinea los widgets en el centro de la pantalla.
          children: [ // Lista de widgets que se van a mostrar en la pantalla de inicio.
            Image.asset('assets/images/quiz.png', width: 250),
            const SizedBox(height: 25), // Espacio entre la imagen y el texto.
            ElevatedButton.icon( // Botón elevado que inicia el quiz.
              onPressed: startQuiz, // Función que se ejecuta al presionar el botón.
              icon: Icon(Icons.play_circle_fill), // Icono play del botón.
              label: Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
