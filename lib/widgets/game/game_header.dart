import 'package:flutter/material.dart';
import 'package:quizz_app/business_logic/game_logic/score/cubit/score_cubit.dart';

class GameHeader extends StatelessWidget {
  final ScoreCubit scoreContext;
  final int lifeNumber;
  GameHeader({required this.lifeNumber, required this.scoreContext}) : super();
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
                  Container(
                    height: 25,
                    child: ListView.builder(
                        itemCount: lifeNumber,
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
                  )
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
              Text(
                '${scoreContext.score}',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
