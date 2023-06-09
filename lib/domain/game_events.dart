abstract class GameEvent{}

class GameMoveUpEvent extends GameEvent{}

class GameMoveDownEvent extends GameEvent{}

class GameMoveLeftEvent extends GameEvent{}

class GameMoveRightEvent extends GameEvent{}

class GameOverEvent extends GameEvent{}

class GameRefreshEvent extends GameEvent{}

class GameUndoEvent extends GameEvent{}

class GameGetRecordEvent extends GameEvent{}
class GameSetRecordEvent extends GameEvent{}

class GameDragEvent extends GameEvent{
  final double x;
  final double y;

  GameDragEvent(this.x, this.y);
}

class GameGenerateNewTileEvent extends GameEvent{}