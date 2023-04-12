import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilesgame/domain/game_bloc.dart';
import 'package:tilesgame/domain/game_events.dart';
import 'package:tilesgame/domain/game_state.dart';
import 'package:tilesgame/widget/cell_empty_widget.dart';
import 'package:tilesgame/widget/cell_widget.dart';

import '../domain/consts.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, state) => GestureDetector(
        onVerticalDragEnd: (details) => context
            .read<GameBloc>()
            .add(GameDragEvent(0, details.velocity.pixelsPerSecond.dy)),
        onHorizontalDragEnd: (details) => context
            .read<GameBloc>()
            .add(GameDragEvent(details.velocity.pixelsPerSecond.dx, 0)),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: context
                  .findAncestorWidgetOfExactType<MaterialApp>()
                  ?.theme
                  ?.scaffoldBackgroundColor,
              boxShadow: [
                blurShadow(
                    neonShadowColor, neonBlur, neonSpread)
              ],
              border: Border.all(width: 3, color: neonColor),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: state.GRID_SIZE,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8),
            itemCount: state.CELLS_COUNT,
            itemBuilder: (BuildContext context, int index) {
              int row = index ~/ state.cells.length;
              int col = index % state.cells.length;
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.cells[row][col] != 0
                      ? Cell(value: state.cells[row][col])
                      : const CellEmpty());
            },
          ),
        ),
      ),
    );
  }
}
