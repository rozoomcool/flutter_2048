import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilesgame/widget/copyright_widget.dart';
import 'package:tilesgame/widget/tablet_widget.dart';

import '../domain/consts.dart';
import '../domain/game_bloc.dart';
import '../domain/game_state.dart';
import '../widget/board_widget.dart';

class GameScene extends StatelessWidget {
  const GameScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.findAncestorWidgetOfExactType<MaterialApp>()!.title),
        centerTitle: true,
        actions: const [Icon(Icons.dark_mode, size: 30,), SizedBox(width: 15)],
      ),
      body: BlocProvider<GameBloc>(
          create: (context) => GameBloc(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: const [
              SizedBox(height: 20),
              TabletWidget(),
              Board(),
              Copyright(),
              SizedBox(height: 20)
            ],
          )),
    );
  }
}
