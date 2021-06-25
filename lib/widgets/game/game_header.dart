import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/life/cubit/life_cubit.dart';
import 'package:quizz_app/business_logic/score/cubit/score_cubit.dart';

class GameHeader extends StatelessWidget {
  //const GameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0xFF252260),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vie :',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  BlocBuilder<LifeCubit, LifeState>(
                    builder: (context, state) {
                      if (state is LifeInitial) {
                        return Container(
                          height: 25,
                          child: ListView.builder(
                              itemCount: state.lifeNumber,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, int index) {
                                return Icon(
                                  Icons.favorite_rounded,
                                  size: 30,
                                  color: Colors.white,
                                );
                              }),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              BlocBuilder<ScoreCubit, ScoreState>(
                builder: (scoreContext, state) {
                  return Text(
                    '${scoreContext.read<ScoreCubit>().score}',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
