import 'package:flutter/material.dart';
import 'package:quizz_app/business_logic/game_logic/game_questions/cubit/game_questions_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/life/cubit/life_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/score/cubit/score_cubit.dart';
import 'package:quizz_app/models/Question.dart';

import '../buttons/common_button.dart';

class GameAnswer extends StatelessWidget {
  final Question question;
  final GameQuestionsCubit gameContext;
  final ScoreCubit scoreContext;
  final LifeCubit lifeContext;
  final int nbQuestions;

  GameAnswer(
      {required this.gameContext,
      required this.scoreContext,
      required this.lifeContext,
      required this.question,
      required this.nbQuestions})
      : super();

  void answerHandler(BuildContext context, {required bool userAnswer}) {
    gameContext.answerToQuestion(currentQuestion: question);

    if (userAnswer == question.answer) {
      scoreContext.setScore();
    } else {
      lifeContext.setLife();
    }
  }

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
                answerHandler(context, userAnswer: true);
              },
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 60,
            width: double.infinity,
            child: CommonButton(
                color: Colors.redAccent,
                text: 'Faux',
                action: () {
                  answerHandler(context, userAnswer: false);
                }),
          ),
        ],
      ),
    );
  }
}
