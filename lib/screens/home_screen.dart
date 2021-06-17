import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333151),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
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
                  onPressed: () {},
                  child: Text(
                    "Options",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
