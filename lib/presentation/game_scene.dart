import 'package:flutter/material.dart';

import '../widget/board_widget.dart';

class GameScene extends StatelessWidget{
  const GameScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('2048'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Board(),
        ],
      )),
    );
  }

}