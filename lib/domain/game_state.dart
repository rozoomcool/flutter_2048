class GameState {
  final int GRID_SIZE;
  late final int CELLS_COUNT;
  int score;

  late List<List<int>> cells;

  GameState.standard()
      : GRID_SIZE = 4,
        score = 0 {
    CELLS_COUNT = GRID_SIZE * GRID_SIZE;
    cells = List.generate(
        GRID_SIZE, (index) => List.generate(GRID_SIZE, (index) => 0));
  }

  GameState.fromState(GameState state)
      : GRID_SIZE = state.GRID_SIZE,
        CELLS_COUNT = state.CELLS_COUNT,
        cells = state.cells,
        score = state.score;
}
