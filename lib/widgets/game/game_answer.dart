import 'package:flutter/material.dart';

import '../buttons/common_button.dart';

class GameAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            child: CommonButton(
              color: Colors.greenAccent,
              text: 'Vrai',
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 60,
            width: double.infinity,
            child: CommonButton(
              color: Colors.redAccent,
              text: 'Faux',
            ),
          ),
        ],
      ),
    );
  }
}
