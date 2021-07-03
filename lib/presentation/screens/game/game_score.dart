import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/game_logic/score/cubit/score_cubit.dart';
import 'package:quizz_app/presentation/layouts/default_layout.dart';
import 'package:quizz_app/widgets/buttons/common_button.dart';
import 'package:quizz_app/widgets/buttons/main_button.dart';

class GameScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Score Final',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${context.read<ScoreCubit>().score}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              text: 'Partager',
                              color: Color(0xFF05071B),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Expanded(
                            child: CommonButton(
                              text: 'Publier',
                              color: Color(0xFF05071B),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      MainButton(
                        text: 'Menu Principal',
                        action: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
