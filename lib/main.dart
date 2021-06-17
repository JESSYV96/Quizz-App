import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/options_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/options': (context) => OptionsScreen()
      },
      initialRoute: '/',
    );
  }
}
