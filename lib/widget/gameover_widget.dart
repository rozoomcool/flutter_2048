import 'package:flutter/material.dart';
import 'package:tilesgame/domain/consts.dart';

class GameOver extends StatelessWidget{
  const GameOver({super.key});

  @override
  Widget build(context) {
    return const Text('Game over', style: gameWarnText);
  }

}