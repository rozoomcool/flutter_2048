abstract class GameEvent{}

class GameMoveUpEvent extends GameEvent{}

class GameMoveDownEvent extends GameEvent{}

class GameMoveLeftEvent extends GameEvent{}

class GameMoveRightEvent extends GameEvent{}

class GameGenerateNewTileEvent extends GameEvent{}