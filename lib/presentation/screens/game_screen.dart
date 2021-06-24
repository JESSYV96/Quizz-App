import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/life/cubit/life_cubit.dart';
import 'package:quizz_app/widgets/game/game_body.dart';
import 'package:quizz_app/widgets/game/game_answer.dart';
import 'package:quizz_app/widgets/game/game_header.dart';

import '../layouts/default_layout.dart';

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

    return DefaultLayout(
      appBar: null,
      screen: BlocProvider<LifeCubit>(
        create: (context) => LifeCubit(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [GameHeader(), GameBody(), GameAnswer()],
          ),
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
                IconButton(
                  onPressed: () {
                    print("joker");
                  },
                  icon: Icon(
                    Icons.lightbulb_sharp,
                    size: 40,
                    // color: colorIcon,
                  ),
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
    );
  }
}
