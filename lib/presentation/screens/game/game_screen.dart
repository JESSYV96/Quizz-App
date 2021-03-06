import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/game_logic/game_questions/cubit/game_questions_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/joker/cubit/joker_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/life/cubit/life_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/score/cubit/score_cubit.dart';
import 'package:quizz_app/models/Question.dart';
import 'package:quizz_app/presentation/screens/game/game_score.dart';
import 'package:quizz_app/widgets/game/game_body.dart';
import 'package:quizz_app/widgets/game/game_answer.dart';
import 'package:quizz_app/widgets/game/game_header.dart';

import '../../layouts/default_layout.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showGameResetDialog() async {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Voulez-vous vraiment quitter ?'),
              actions: [
                TextButton(
                  child: Text('Non'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Oui'),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
              ],
            );
          });
    }

    Future<void> _showGameJokerDialog(BuildContext jokerContext) async {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Souhaitez-vous utiliser un joker ?'),
              content: Text(
                  'Joker restants : ${jokerContext.read<JokerCubit>().nbJoker}'),
              actions: [
                TextButton(
                  child: Text('Non'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Oui'),
                  onPressed: () {
                    print('Joker -1 and next question');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return BlocProvider<GameQuestionsCubit>(
      create: (gameQuestionsContext) =>
          GameQuestionsCubit()..getStartedQuestionsForGame(),
      child: DefaultLayout(
        appBar: null,
        screen: Container(
          child: BlocBuilder<ScoreCubit, ScoreState>(
            builder: (scoreContext, scoreState) {
              return BlocBuilder<LifeCubit, LifeState>(
                builder: (lifeContext, lifeState) {
                  return BlocBuilder<GameQuestionsCubit, GameQuestionsState>(
                    builder: (gameContext, state) {
                      if (state is GameQuestions && lifeState is LifeInitial) {
                        final int lifeNumber =
                            lifeContext.read<LifeCubit>().lifeNumber;
                        if (lifeNumber == 0 || state.questions.isEmpty) {
                          return GameScore();
                        } else {
                          final Question currentQuestion = state.questions[0];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GameHeader(
                                scoreContext: scoreContext.read<ScoreCubit>(),
                                lifeNumber:
                                    lifeContext.read<LifeCubit>().lifeNumber,
                              ),
                              GameBody(question: currentQuestion),
                              GameAnswer(
                                gameContext:
                                    gameContext.read<GameQuestionsCubit>(),
                                lifeContext: lifeContext.read<LifeCubit>(),
                                scoreContext: scoreContext.read<ScoreCubit>(),
                                question: currentQuestion,
                                nbQuestions: state.questions.length,
                              )
                            ],
                          );
                        }
                      }
                      return Container();
                    },
                  );
                },
              );
            },
          ),
        ),
        bottomBar: BottomAppBar(
          color: Color(0xFF333151),
          child: IconTheme(
            data: IconThemeData(color: Color(0xFF8a4fe2), size: 40),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _showGameResetDialog();
                    },
                    icon: Icon(
                      Icons.home,
                      size: 40,
                      // color: colorIcon,
                    ),
                  ),
                  BlocBuilder<JokerCubit, JokerState>(
                    builder: (jokerContext, state) {
                      return IconButton(
                        onPressed: () {
                          _showGameJokerDialog(jokerContext);
                        },
                        icon: Icon(
                          Icons.lightbulb_sharp,
                          size: 40,
                          // color: colorIcon,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      print("Change parameters");
                    },
                    icon: Icon(
                      Icons.settings,
                      size: 40,
                      // color: colorIcon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
