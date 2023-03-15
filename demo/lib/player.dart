import 'package:flutter/material.dart';


class MyPlayer extends StatelessWidget {
  final playerX;
  MyPlayer({this.playerX});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          color: Colors.amber,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
