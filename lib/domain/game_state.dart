class GameState {
  final int GRID_SIZE;
  late final int CELLS_COUNT;

  late List<List<int>> cells;

  GameState.standard() : GRID_SIZE = 4{
    CELLS_COUNT = GRID_SIZE * GRID_SIZE;
    cells = List.filled(GRID_SIZE, List.filled(GRID_SIZE, 0));
  }
}