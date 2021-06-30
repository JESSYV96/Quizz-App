import 'package:flutter/material.dart';
import 'package:quizz_app/presentation/layouts/default_layout.dart';

class GameScore extends StatelessWidget {
  const GameScore ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Text('Score final'),
    );
  }
}