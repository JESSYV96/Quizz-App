import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/game_logic/game_questions/cubit/game_questions_cubit.dart';

class GameBody extends StatelessWidget {
  const GameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameQuestionsCubit, GameQuestionsState>(
      bloc: BlocProvider.of<GameQuestionsCubit>(context, listen: true),
      builder: (context, state) {
        if (state is GameQuestionsStart) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "${state.questions[0].title} \n ${state.questions[0].id.substring(0, 8)}",
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
        return Container();
      },
    );
  }
}
