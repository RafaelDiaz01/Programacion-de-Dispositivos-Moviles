class Question {
  const Question ({required this.textQuestion, required this.answers});

  final String textQuestion;
  final List<String> answers;

  List<String> shuffleAnswers () {
    final copyOfList = List.of(answers);
    copyOfList.shuffle();
    return copyOfList;
  }
}

final listQuestions = [
    Question(textQuestion: "¿Qué país tiene más mundiales?", answers: ["Brazil", "México", "Francia", "Argentina"]),
    Question(textQuestion: "¿Quién fue el ganador del mundial 2018?", answers: ["Francia", "Croacia", "Alemania", "España"]),
    Question(textQuestion: "¿Dondé se jugará el mundial 2026?", answers: ["México-USA-Canadá", "Arabia Saudita"]),
    Question(textQuestion: "¿En dónde se jugó el mundial 2010?", answers: ["Sudafrica", "Brazil", "Japón", ]),
  ];