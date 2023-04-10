import 'package:flutter/material.dart';
import 'package:tilesgame/presentation/game_scene.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: const GameScene(),
    );
  }
}
