// Kevin Rafael Díaz López - 08/05/2024
// Arhivo que contiene la lista de preguntas y respuestas del Quiz.


class Question {
  const Question ({required this.textQuestion, required this.answers}); // Constructor de la clase, recibe como parámetros el texto de la pregunta y la lista de respuestas.

  final String textQuestion; // Texto de la pregunta.
  final List<String> answers; // Lista de respuestas.

  // Método que devuelve una lista de respuestas en orden aleatorio.
  List<String> shuffleAnswers () {
    final copyOfList = List.of(answers); // Crea una copia de la lista de respuestas.
    copyOfList.shuffle(); // Baraja la lista de respuestas en orden aleatorio.
    // Esto es para que las respuestas se muestren en orden aleatorio cada vez que se carga la pantalla.
    return copyOfList; // Devuelve la lista de respuestas en orden aleatorio.
  }
}

// Esta lista contiene las preguntas y respuestas del Quiz.
// Cada pregunta es un objeto de la clase Question, que contiene el texto de la pregunta y la lista de respuestas.
final listQuestions = [
    Question(textQuestion: "¿Qué país tiene más mundiales?", answers: ["Brazil", "México", "Francia", "Argentina"]),
    Question(textQuestion: "¿Quién fue el ganador del mundial 2018?", answers: ["Francia", "Croacia", "Alemania", "España"]),
    Question(textQuestion: "¿Dondé se jugará el mundial 2026?", answers: ["México-USA-Canadá", "Arabia Saudita"]),
    Question(textQuestion: "¿En dónde se jugó el mundial 2010?", answers: ["Sudafrica", "Brazil", "Japón", ]),
  ];