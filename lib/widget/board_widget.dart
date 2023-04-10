import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilesgame/domain/game_bloc.dart';
import 'package:tilesgame/domain/game_state.dart';
import 'package:tilesgame/widget/cell_empty_widget.dart';
import 'package:tilesgame/widget/cell_widget.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, state) => Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
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
            return state.cells[row][col] != 0 ? Cell(index: index) : const CellEmpty();
          },
        ),
      ),
    );
  }
}
