import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/buttons/common_button.dart';
import 'package:quizz_app/widgets/buttons/main_button.dart';

import '../layouts/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: null,
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              MainButton(
                text: "Jouer",
                action: () {
                  Navigator.pushNamed(context, '/game');
                },
              ),
              SizedBox(height: 30),
              MainButton(text: "Classement"),
              SizedBox(height: 30),
              MainButton(
                text: "Proposer une question",
                action: () {
                  Navigator.pushNamed(context, '/questions');
                },
              ),
            ],
          ),
          CommonButton(
            text: "Options",
            color: Color(0xFFD33920),
            action: () {
              Navigator.pushNamed(context, '/options');
            },
          )
        ],
      ),
    );
  }
}
