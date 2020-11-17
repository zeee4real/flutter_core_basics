import 'package:flutter/material.dart';
import 'package:flutter_core_basics/quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    print("Question answered");
  }

  final questions = [
    {
      "questionText": "what's your fav color",
      "answers": [
        {"text": "Blue", "score": 5},
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 8},
        {"text": "White", "score": 1},
        {"text": "Purple", "score": 6},
      ]
    },
    {
      "questionText": "what's your fav destination",
      "answers": [
        {"text": "London", "score": 5},
        {"text": "Paris", "score": 10},
        {"text": "Spain", "score": 8},
        {"text": "Italy", "score": 1}
      ]
    },
    {
      "questionText": "what's your fav animal",
      "answers": [
        {"text": "Cat", "score": 5},
        {"text": "Dog", "score": 10},
        {"text": "Lion", "score": 8},
        {"text": "Cheetah", "score": 1}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("First App"),
          ),
          body: _questionIndex < questions.length
              ? Quiz(questions, _answerQuestion, _questionIndex)
              : Result(_totalScore, _resetQuiz),
        ),
      );
}
