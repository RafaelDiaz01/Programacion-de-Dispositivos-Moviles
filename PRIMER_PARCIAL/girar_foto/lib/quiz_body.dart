// Kevin Rafael Díaz López - 08/05/2024
// Archiv que contiene el cuerpo del Quiz.

import 'package:flutter/material.dart';
import 'package:girar_foto/questions.dart';

// Esta clase es StatefulWidget porque tiene estado, ya que cambia el número de pregunta al seleccionar una respuesta.
class QuizBody extends StatefulWidget {
  const QuizBody({super.key, required this.addSelectedAnswer}); // Constructor de la clase, recibe como parámetro la función para agregar la respuesta seleccionada.

  final void Function(String)
  addSelectedAnswer; // Función para guardar las respuestas.

  @override
  State<QuizBody> createState() => _QuizBodyState(); // Estado de la clase QuizBody.
}

// Esta clase es el estado de la clase QuizBody, que contiene la lógica y el estado de la pantalla de preguntas.
class _QuizBodyState extends State<QuizBody> {
  int _questionNumber = 0; // Variable que guarda el número de pregunta actual.

  // Método que se ejecuta al seleccionar una respuesta.
  void onSelectedAnswer(String answers) {
    widget.addSelectedAnswer(answers); // Llama a la función para agregar la respuesta seleccionada.

    setState(() {
      _questionNumber++; // Aumenta el número de pregunta actual.
    });
  }

  // Método build que construye la interfaz de la pantalla de preguntas.
  @override
  Widget build(BuildContext context) {
    Question currentQuestion = listQuestions[_questionNumber]; // Obtiene la pregunta actual de la lista de preguntas.

    return Scaffold( // Scaffold es un widget que proporciona una estructura básica para la pantalla.
      body: Container( // Container es un widget que permite personalizar el diseño de la pantalla.
        decoration: BoxDecoration(color: Color.fromRGBO(158, 198, 243, 10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color.fromRGBO(255, 255, 255, 10),
                child: Column(
                  children: [
                    Text(
                      currentQuestion.textQuestion, // Texto de la pregunta actual, que se obtiene de la lista de preguntas.
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ...currentQuestion.shuffleAnswers().map((answers) { // Mapea las respuestas de la pregunta actual y crea un botón para cada respuesta. 
                // La función shuffleAnswers() devuelve una lista de respuestas en orden aleatorio.
                // Esto es para que las respuestas se muestren en orden aleatorio cada vez que se carga la pantalla.
                // La función map() aplica una función a cada elemento de la lista y devuelve una nueva lista con los resultados.
                // En este caso, se crea un botón para cada respuesta.
                return Column(
                  children: [
                    SizedBox(height: 15),
                    ElevatedButton( // Botón elevado que muestra la respuesta.
                      onPressed: () {
                        onSelectedAnswer(answers); // Llama al método onSelectedAnswer() al presionar el botón, que agrega la respuesta seleccionada y aumenta el número de pregunta.
                        // Si el número de pregunta es igual al número de preguntas en la lista, se muestra la pantalla de resultados.
                      },
                      child: Text(answers), // Texto del botón, muestra la respuesta de la lista de respuestas.
                    ),
                  ],
                );
              }),
              SizedBox(height: 100,),
              ElevatedButton.icon( // Botón que regresa al inicio del Quiz.
                onPressed: () {},
                icon: Icon(Icons.home_filled),
                label: Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
