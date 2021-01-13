import 'dart:ui';
import 'package:computerdestroyed/gamePrincipal.dart';
import 'package:flame/sprite.dart';

/* arquivo q cria imagem de fundo */

class Fundo {
  final GamePrincipal game;
  Sprite bgSprite;
  Rect bgRect;

  Fundo(this.game) {
    bgSprite = Sprite('fundo/fundoTec.jpg');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }
}
