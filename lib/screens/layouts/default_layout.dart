import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({Key? key, this.appBar, required this.screen})
      : super(key: key);

  final AppBar? appBar;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      backgroundColor: Color(0xFF333151),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: this.screen,
        ),
      ),
    );
  }
}
