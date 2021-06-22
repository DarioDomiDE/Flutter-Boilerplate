import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.questionText);
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: TextStyle(fontSize: 28),
    );
  }
}
