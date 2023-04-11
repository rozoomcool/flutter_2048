import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/game_bloc.dart';
import '../domain/game_state.dart';
import '../widget/board_widget.dart';

class GameScene extends StatelessWidget {
  const GameScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2048'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: BlocProvider<GameBloc>(
              create: (context) => GameBloc(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<GameBloc, GameState>(
                      builder: (BuildContext context, state) => Container(
                            height: 100,
                            width: double.infinity,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.all(8.0),
                            child: Align(alignment: Alignment.center,child: Text('${state.score}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 45, color: Colors.white),)),
                          )),
                  Board(),
                ],
              ))),
    );
  }
}
