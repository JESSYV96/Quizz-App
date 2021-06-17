import 'package:flutter/material.dart';

import 'layouts/default_layout.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Center(
        child: Text('Game'),
      ),
    );
  }
}
