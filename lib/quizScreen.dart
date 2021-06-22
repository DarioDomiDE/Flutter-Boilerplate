import 'package:flutter/material.dart';
import 'answerButton.dart';
import 'obj/questionData.dart';
import 'question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  static const data = [
    QuestionData(
      'Whats your fav. color?',
      ['Rot', 'Blau'],
    ),
    QuestionData(
      'Whats your fav. Pet?',
      ['Hund', 'Katze'],
    ),
    QuestionData(
      'Whats your fav. Car?',
      ['Sportwagen', 'CamperVan'],
    ),
    QuestionData(
      'Programming Language?',
      ['C#', 'Java'],
    ),
  ];
  int index = 0;

  void answerQuestion(int id) {
    setState(() {
      print('Answer chosen: ' + id.toString());
      index++;
      if (index == data.length) {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Question((index + 1).toString() + ': ' + data[index].question),
          Row(
            children: [
              Answer(data[index].answers[0], 1, answerQuestion),
              Answer(data[index].answers[1], 2, answerQuestion),
            ],
          ),
        ]),
      ),
    );
  }
}
