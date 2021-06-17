import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({required this.text, required this.color, this.routeName})
      : super();
  final Color color;
  final String text;
  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
            backgroundColor: MaterialStateProperty.all(color)),
        onPressed: () {
          if (routeName != null) {
            Navigator.pushNamed(context, routeName!);
          }
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 19),
        ),
      ),
    );
  }
}
