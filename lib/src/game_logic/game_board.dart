import 'package:link_five/src/game_logic/infinite_matrix.dart';
import 'package:link_five/src/game_logic/player_color.dart';

class GameBoard {
  final _tiles = InfiniteMatrix<PlayerColor>();

  PlayerColor? tile(int x, int y) => _tiles.get(x, y);

  List<Tile> get tiles => _tiles.all.map((e) => Tile(e.x, e.y, e.value)).toList();

  void placeTile(int x, int y, PlayerColor color) => _tiles.set(x, y, color);
}

class Tile {
  int x;
  int y;
  PlayerColor value;

  Tile(this.x, this.y, this.value);
}
