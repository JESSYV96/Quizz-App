import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/game_logic/joker/cubit/joker_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/life/cubit/life_cubit.dart';
import 'package:quizz_app/business_logic/game_logic/score/cubit/score_cubit.dart';
import 'package:quizz_app/business_logic/options_logic/vibration/cubit/vibration_cubit.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout(
      {Key? key, this.appBar, required this.screen, this.bottomBar})
      : super(key: key);

  final AppBar? appBar;
  final BottomAppBar? bottomBar;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LifeCubit>(
          create: (context) => LifeCubit(lifeNumber: 3),
        ),
        BlocProvider<JokerCubit>(
          create: (context) => JokerCubit(nbJoker: 2),
        ),
        BlocProvider<ScoreCubit>(
          create: (context) => ScoreCubit(score: 0),
        ),
        BlocProvider<VibrationCubit>(
          create: (context) => VibrationCubit(isVibrate: false),
        ),
      ],
      child: Scaffold(
        appBar: this.appBar,
        backgroundColor: Color(0xFF333151),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: this.screen,
          ),
        ),
        bottomNavigationBar: this.bottomBar,
      ),
    );
  }
}
