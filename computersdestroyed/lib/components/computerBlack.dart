import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:computerdestroyed/components/computers.dart';
import 'package:computerdestroyed/gamePrincipal.dart';

/* arquivo especifico para criar um computador inimigo especifico */

class ComputerBlack extends Computers {
  double get speed => game.tileSize * 5;

  ComputerBlack(GamePrincipal game, double x, double y) : super(game) {
    computersRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    computerSprite = List<Sprite>();
    computerSprite.add(Sprite('files/pc.png'));
    deadSprite = Sprite('files/dead.png');
  }
}
