import 'package:shared_preferences/shared_preferences.dart';

class GameState {
  final int GRID_SIZE;
  late final int CELLS_COUNT;
  int score;
  int currentMax;
  int record = 0;
  bool isGameOver;

  late List<List<int>> cells;

  GameState.standard()
      : GRID_SIZE = 4,
        currentMax = 0,
        isGameOver = false,
        score = 0 {
    CELLS_COUNT = GRID_SIZE * GRID_SIZE;
    cells = List.generate(
        GRID_SIZE, (index) => List.generate(GRID_SIZE, (index) => 0));
  }

  GameState.fromState(GameState state)
      : GRID_SIZE = state.GRID_SIZE,
        CELLS_COUNT = state.CELLS_COUNT,
        cells = state.cells,
        currentMax = 0,
        record = state.record,
        score = state.score,
        isGameOver = state.isGameOver;
}
