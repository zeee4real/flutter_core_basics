import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int _questionIndex;
  final Function _answerQuestion;

  Quiz(this.questions, this._answerQuestion, this._questionIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[_questionIndex]["questionText"]),
        ...(questions[_questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => _answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
