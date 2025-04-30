import 'package:flutter/material.dart';
import 'package:girar_foto/questions.dart';

class QuizBody extends StatefulWidget {
const QuizBody ({super.key});

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int _questionNumber = 0;

  void onSelectedAnswer() {
    setState(() {
      _questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = listQuestions[_questionNumber];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(158, 198, 243, 10),          
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.textQuestion, style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
              SizedBox(height: 20),
              
              ...currentQuestion.shuffleAnswers().map((answers) {
                return Column(
                  children: [
                    SizedBox(height: 15,), ElevatedButton(onPressed: onSelectedAnswer, child: Text(answers))
                  ],
                );})
            ],
          ),
        ),
      ),
    );
  }
}
