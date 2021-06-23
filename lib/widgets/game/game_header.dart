import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  //const GameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0xFF252260),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vie :',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '0',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
