import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(
    this.answerText,
    this.id,
    this.onClick,
  );

  final String answerText;
  final int id;
  final Function(int) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: () => onClick(id),
      ),
    );
  }
}
