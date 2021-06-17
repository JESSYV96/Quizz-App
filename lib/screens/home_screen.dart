import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/main_button.dart';

import 'layouts/default_layout.dart';

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
              MainButton(text: "Jouer"),
              SizedBox(height: 30),
              MainButton(text: "Classement"),
              SizedBox(height: 30),
              MainButton(text: "Proposer une question"),
            ],
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20)),
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFFD33920))),
              onPressed: () {
                Navigator.pushNamed(context, '/options');
              },
              child: Text(
                "Options",
                style: TextStyle(fontSize: 19),
              ),
            ),
          )
        ],
      ),
    );
  }
}
