import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  const MainButton({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: new LinearGradient(
          colors: [
            Color(0xFF8000FF),
            Color(0xFFDE00FF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        onPressed: () {},
      ),
    );
  }
}
