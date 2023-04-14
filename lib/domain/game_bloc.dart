import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tilesgame/model/CellModel.dart';
import 'game_events.dart';

import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.standard()) {
    on<GameGenerateNewTileEvent>(_generateNewTile);
    on<GameDragEvent>(_gameDragEvent);
    on<GameMoveRightEvent>(_moveRight);
    on<GameMoveLeftEvent>(_moveLeft);
    on<GameMoveDownEvent>(_moveDown);
    on<GameMoveUpEvent>(_moveUp);
    on<GameRefreshEvent>(_gameRefreshEvent);
    on<GameOverEvent>(_checkGameOverEvent);
    on<GameUndoEvent>(_gameUndoEvent);
    on<GameGetRecordEvent>(_gameGetRecordEvent);
    on<GameSetRecordEvent>(_gameSetRecordEvent);
    add(GameGenerateNewTileEvent());
    add(GameGetRecordEvent());
  }

  void _gameRefreshEvent(GameRefreshEvent event, Emitter<GameState> emit) {
    emit(GameState.standard());
    add(GameGenerateNewTileEvent());
  }

  void _checkGameOverEvent(GameOverEvent event, Emitter<GameState> emit) {
    for (int row = 0; row < state.cells.length - 1; row++) {
      for (int col = 0; col < state.cells.length - 1; col++) {
        if (state.cells[row][col] == 0 || state.cells[row][col + 1] == 0) {
          return;
        }
        if (state.cells[row][col] == state.cells[row][col + 1]) {
          return;
        }
        if (state.cells[col][row] == 0 || state.cells[col + 1][row] == 0) {
          return;
        }
        if (state.cells[col][row] == state.cells[col + 1][row]) {
          return;
        }
      }
    }

    state.isGameOver = true;
    emit(GameState.fromState(state));
  }

  void _moveRight(GameMoveRightEvent event, Emitter<GameState> emit) {
    bool moved = false;
    for (int row = 0; row < state.cells.length; row++) {
      for (int col = state.cells[row].length - 2; col >= 0; col--) {
        if (state.cells[row][col] != 0) {
          for (int k = col; k < state.cells[col].length - 1; k++) {
            if (state.cells[row][k + 1] == 0) {
              state.cells[row][k + 1] = state.cells[row][k];
              state.cells[row][k] = 0;
              moved = true;
            } else if (state.cells[row][k + 1] == state.cells[row][k]) {
              state.cells[row][k + 1] *= 2;
              state.cells[row][k] = 0;
              state.score += state.cells[row][k + 1];
              moved = true;
              break;
            } else {
              break;
            }
          }
        }
      }
    }
    if (moved) {
      checkMax();
      add(GameGenerateNewTileEvent());
      emit(GameState.fromState(state));
    } else {
      add(GameOverEvent());
    }
  }

  void _moveLeft(GameMoveLeftEvent event, Emitter<GameState> emit) {
    bool moved = false;
    for (int row = 0; row < state.cells.length; row++) {
      for (int col = 1; col < state.cells[row].length; col++) {
        if (state.cells[row][col] != 0) {
          for (int k = col; k > 0; k--) {
            if (state.cells[row][k - 1] == 0) {
              state.cells[row][k - 1] = state.cells[row][k];
              state.cells[row][k] = 0;
              moved = true;
            } else if (state.cells[row][k - 1] == state.cells[row][k]) {
              state.cells[row][k - 1] *= 2;
              state.cells[row][k] = 0;
              state.score += state.cells[row][k - 1];
              moved = true;
              break;
            } else {
              break;
            }
          }
        }
      }
    }
    if (moved) {
      checkMax();
      add(GameGenerateNewTileEvent());
      emit(GameState.fromState(state));
    } else {
      add(GameOverEvent());
    }
  }

  void _moveUp(GameMoveUpEvent event, Emitter<GameState> emit) {
    bool moved = false;

    for (int col = 0; col < state.cells.length; col++) {
      for (int row = 1; row < state.cells.length; row++) {
        if (state.cells[row][col] != 0) {
          for (int k = row; k >= 1; k--) {
            if (state.cells[k - 1][col] == state.cells[k][col]) {
              state.cells[k - 1][col] *= 2;
              state.cells[k][col] = 0;
              state.score += state.cells[k - 1][col];
              moved = true;
            } else if (state.cells[k - 1][col] == 0) {
              state.cells[k - 1][col] = state.cells[k][col];
              state.cells[k][col] = 0;
              moved = true;
            } else {
              break;
            }
          }
        }
      }
    }

    if (moved) {
      checkMax();
      add(GameGenerateNewTileEvent());
      emit(GameState.fromState(state));
    } else {
      add(GameOverEvent());
    }
  }

  // void _moveUp(GameMoveUpEvent event, Emitter<GameState> emit) {
  //   bool moved = false;
  //
  //   for (int col = 0; col < state.cells.length; col++) {
  //     for (int row = 1; row < state.cells.length; row++) {
  //       if (state.cells[row][col] != 0) {
  //         for (int k = row; k >= 1; k--) {
  //           if (state.cells[k - 1][col] == state.cells[k][col]) {
  //             state.cells[k - 1][col] *= 2;
  //             state.cells[k][col] = 0;
  //             moved = true;
  //           } else if (state.cells[k - 1][col] == 0) {
  //             state.cells[k - 1][col] = state.cells[k][col];
  //             state.cells[k][col] = 0;
  //             moved = true;
  //             break;
  //           } else {
  //             break;
  //           }
  //         }
  //       }
  //     }
  //   }
  //
  //   if (moved) {
  //     add(GameGenerateNewTileEvent());
  //     emit(GameState.fromState(state));
  //   }
  // }

  // void _moveDown(GameMoveDownEvent event, Emitter<GameState> emit) {
  //   bool moved = false;
  //
  //   for (int col = 0; col < state.cells.length; col++) {
  //     for (int row = state.cells.length - 2; row >= 0; row--) {
  //       if (state.cells[row][col] != 0) {
  //         for (int k = row; k > state.cells.length - 1; k++) {
  //           if (state.cells[k + 1][col] == state.cells[k][col]) {
  //             state.cells[k + 1][col] *= 2;
  //             state.cells[k][col] = 0;
  //             moved = true;
  //           } else if (state.cells[k + 1][col] == 0) {
  //             state.cells[k + 1][col] = state.cells[k][col];
  //             state.cells[k][col] = 0;
  //             moved = true;
  //           } else {
  //             break;
  //           }
  //         }
  //       }
  //     }
  //   }
  //
  //   if (moved) {
  //     add(GameGenerateNewTileEvent());
  //     emit(GameState.fromState(state));
  //   }
  // }

  void _moveDown(GameMoveDownEvent event, Emitter<GameState> emit) {
    bool moved = false;

    for (int col = 0; col < state.cells.length; col++) {
      for (int row = state.cells.length - 2; row >= 0; row--) {
        if (state.cells[row][col] != 0) {
          for (int k = row; k < state.cells.length - 1; k++) {
            if (state.cells[k + 1][col] == state.cells[k][col]) {
              state.cells[k + 1][col] *= 2;
              state.cells[k][col] = 0;
              state.score += state.cells[k + 1][col];
              moved = true;
            } else if (state.cells[k + 1][col] == 0) {
              state.cells[k + 1][col] = state.cells[k][col];
              state.cells[k][col] = 0;
              moved = true;
            } else {
              break;
            }
          }
        }
      }
    }

    if (moved) {
      checkMax();
      add(GameGenerateNewTileEvent());
      emit(GameState.fromState(state));
    } else {
      add(GameOverEvent());
    }
  }

  void _gameDragEvent(GameDragEvent event, Emitter<GameState> emit) async {
    if (!state.isGameOver) {
      await _gameSaveCurrent();
      if (event.y.abs() > event.x.abs()) {
        event.y < 0 ? add(GameMoveUpEvent()) : add(GameMoveDownEvent());
      } else {
        event.x > 0 ? add(GameMoveRightEvent()) : add(GameMoveLeftEvent());
      }
      add(GameSetRecordEvent());
    }
  }

  void _generateNewTile(
      GameGenerateNewTileEvent event, Emitter<GameState> emit) {
    List<CellModel> emptyCells = [];

    for (int i = 0; i < state.cells.length; i++) {
      for (int j = 0; j < state.cells[i].length; j++) {
        if (state.cells[i][j] == 0) {
          emptyCells.add(CellModel(x: i, y: j));
        }
      }
    }

    if (emptyCells.isNotEmpty) {
      CellModel model = emptyCells[Random().nextInt(emptyCells.length)];
      state.cells[model.x][model.y] = Random().nextInt(10) == 0 ? 4 : 2;

      emit(GameState.fromState(state));
    }
  }

  void updateStateFromState(Emitter<GameState> emit) {
    emit(GameState.fromState(state));
  }

  Future<void> _gameSaveCurrent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('last_state',
        state.cells.map((innerList) => jsonEncode(innerList)).toList());
  }

  void _gameUndoEvent(GameUndoEvent event, Emitter<GameState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('last_state')) {
      // print("yappy");
      state.cells = prefs
          .getStringList('last_state')!
          .map((str) => List<int>.from(jsonDecode(str)))
          .toList();
      emit(GameState.fromState(state));
    }
  }

  void checkMax() {
    if (state.score > state.currentMax) {
      state.currentMax = state.score;
    }
  }

  void _gameGetRecordEvent(
      GameGetRecordEvent event, Emitter<GameState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('record')) {
      state.record = prefs.getInt('record') ?? 0;
      emit(GameState.fromState(state));
    } else{
      add(GameSetRecordEvent());
    }
  }

  void _gameSetRecordEvent(GameSetRecordEvent event, Emitter<GameState> emit) async {
    if (state.score >= state.record) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('record', state.score);
      add(GameGetRecordEvent());
    }
  }
}
