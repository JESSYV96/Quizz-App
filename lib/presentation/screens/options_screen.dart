import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/common_button.dart';
import '../layouts/default_layout.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: Text('Options'),
        backgroundColor: Colors.transparent,
      ),
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonButton(
            text: 'Niveau : Facile',
            color: Color(0xFF05071B),
          ),
          SizedBox(height: 50),
          CommonButton(
            text: 'Thème : Divers',
            color: Color(0xFF05071B),
          ),
          SizedBox(height: 50),
          CommonButton(
            text: 'Son et vibration',
            color: Color(0xFF05071B),
          ),
        ],
      ),
    );
  }
}
