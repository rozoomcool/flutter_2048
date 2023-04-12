import 'package:flutter/material.dart';

const TextStyle gameTabletText = TextStyle(fontWeight: FontWeight.bold,
    fontSize: 25,
    color: Colors.white, fontFamily: 'PressStart2P');

const TextStyle gameTileText = TextStyle(fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white, fontFamily: 'PressStart2P');

const TextStyle gameCopyrightText = TextStyle(fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white, fontFamily: 'PressStart2P');

Color neonShadowColor = Colors.red.withOpacity(0.5);

Color neonColor = Colors.pinkAccent;

Color recordColor = Colors.amber;

const double neonBlur = 5;

const double neonSpread = 3;

const double neonSecondarySpread = 1;

BoxShadow blurShadow(Color c, double blur, double spread){
  return BoxShadow(
  color: c,
  blurRadius: blur,
  spreadRadius: spread
  );
}