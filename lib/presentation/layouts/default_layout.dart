import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/joker/cubit/joker_cubit.dart';
import 'package:quizz_app/business_logic/life/cubit/life_cubit.dart';

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
          create: (context) => JokerCubit(nbJoker: 5),
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
