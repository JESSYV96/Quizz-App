import 'package:flutter/material.dart';
import 'package:quizz_app/presentation/layouts/default_layout.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Center(
        child: CircularProgressIndicator(
          color: Color(0xFFDE00FF),
        ),
      ),
    );
  }
}
