// Kevin Rafael Díaz López - 08/05/2024
// Archivo que contienes los resultados del Quiz.

import 'package:flutter/material.dart';
import 'package:girar_foto/questions.dart';

// Esta clase es StatelessWidget porque no tiene estado, solo muestra los resultados.
// Recibe como parámetros la lista de respuestas seleccionadas y la función para regresar al inicio del Quiz.
// Esta clase se utiliza para mostrar los resultados del Quiz después de que el usuario ha respondido todas las preguntas.
class QuizResults extends StatelessWidget {
  const QuizResults({super.key, required this.selectedAnswers, required this.home}); // Constructor de la clase, recibe como parámetros la lista de respuestas seleccionadas y la función para regresar al inicio del Quiz.
  final List<String> selectedAnswers; // Lista de respuestas seleccionadas por el usuario.
  final void Function() home; // Función para regresar al inicio del Quiz.

  // Método build que construye la interfaz de la pantalla de resultados.
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold es un widget que proporciona una estructura básica para la pantalla.
      body: Container( // Container es un widget que permite personalizar el diseño de la pantalla.
        decoration: BoxDecoration(color: Color.fromRGBO(158, 198, 243, 10)),
        child: Center( // Center es un widget que centra su hijo dentro de su área disponible.
          child: Column( // Column es un widget que organiza sus hijos en una columna vertical.
            mainAxisAlignment: MainAxisAlignment.center, // Alinea los widgets en el centro de la pantalla.
            children: [ // Lista de widgets que se van a mostrar en la pantalla de resultados.
              Text("Resultados", style: TextStyle(fontSize: 40)), // Título de la pantalla de resultados.
              SizedBox(height: 20), // Espacio entre el título y el resto de la pantalla.
              Container( // Container que contiene los resultados del Quiz.
                color: Color.fromRGBO(255, 255, 255, 10),
                child: Column(
                  children: [
                    Text(
                      "Pregunta 1: ${listQuestions[0].textQuestion}", // Texto de la pregunta 1, que se obtiene de la lista de preguntas.
                      style: TextStyle(fontSize: 20), // Tamaño de la fuente del texto.
                      textAlign: TextAlign.center, // Alineación del texto al centro.
                    ),
                    SizedBox(height: 10), // Espacio entre el texto de la pregunta y las respuestas.
                    Text(
                      "Respuesta Correcta: ${listQuestions[0].answers[0]}", // Respuesta correcta de la pregunta 1, que se obtiene de la lista de preguntas.
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Respuesta Seleccionada: ${selectedAnswers[0]}", // Respuesta seleccionada por el usuario para la pregunta 1, que se obtiene de la lista de respuestas seleccionadas.
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100), // Espacio entre los resultados y el botón de inicio.
              ElevatedButton.icon( // Botón elevado que regresa al inicio del Quiz.
                onPressed: home, // Función que se ejecuta al presionar el botón.
                icon: Icon(Icons.home), // Icono de casa para el botón.
                label: Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
