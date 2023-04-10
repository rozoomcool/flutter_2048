import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilesgame/model/CellModel.dart';
import 'game_events.dart';

import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.standard()){
    on<GameGenerateNewTileEvent>(_generateNewTile);
  }

  void _generateNewTile(GameGenerateNewTileEvent event, Emitter<GameState> emit){
    CellModel cell = CellModel(value: 2, x: Random().nextInt(3), y: Random().nextInt(3));
    if(state.cells[cell.x][cell.y] == 0){
      state.cells[cell.x][cell.y] = cell.value;
      emit(state);
    }
  }
}
