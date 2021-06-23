import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/game/game_body.dart';
import 'package:quizz_app/widgets/game/game_answer.dart';
import 'package:quizz_app/widgets/game/game_header.dart';

import '../layouts/default_layout.dart';

class GameScreen extends StatelessWidget {
  //const GameScreen({Key? key}) : super(key: key);
  static const double sizeIcon = 37;
  static const Color colorIcon = Color(0xFF8a4fe2);
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: null,
      screen: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [GameHeader(), GameBody(), GameAnswer()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF333151),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: sizeIcon,
              color: colorIcon,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lightbulb_sharp,
              size: sizeIcon,
              color: colorIcon,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: sizeIcon,
              color: colorIcon,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
