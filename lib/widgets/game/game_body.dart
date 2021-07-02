import 'package:flutter/material.dart';
import 'package:quizz_app/models/Question.dart';

class GameBody extends StatelessWidget {
  final Question question;
  GameBody({required this.question}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "${question.title} \n ${question.id.substring(0, 8)}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
