import 'package:flutter/material.dart';
import 'package:quizz_app/business_logic/game_logic/game_questions/cubit/game_questions_cubit.dart';
import 'package:quizz_app/models/Question.dart';

import '../buttons/common_button.dart';

class GameAnswer extends StatelessWidget {
  final Question question;
  final GameQuestionsCubit gameContext;
  final int nbQuestions;
  GameAnswer(this.gameContext,
      {required this.question, required this.nbQuestions})
      : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            child: CommonButton(
                color: Colors.greenAccent,
                text: 'Vrai',
                action: () {
                  if (nbQuestions > 1) {
                    gameContext.answerToQuestion(questionId: question.id);
                  } else {
                    Navigator.pushNamed(context, '/game/score');
                  }
                }),
          ),
          SizedBox(height: 25),
          Container(
            height: 60,
            width: double.infinity,
            child: CommonButton(
              color: Colors.redAccent,
              text: 'Faux',
            ),
          ),
        ],
      ),
    );
  }
}
