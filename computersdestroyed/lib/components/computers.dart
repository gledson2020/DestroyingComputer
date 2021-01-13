import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:computerdestroyed/gamePrincipal.dart';

/* arquivo que pega as imagens e animação dos inimigos do jogo */

class Computers {
  Rect computersRect;
  final GamePrincipal game;
  List<Sprite> computerSprite;
  Sprite deadSprite;
  double computerSpriteIndex = 0;
  bool isDead = false;
  bool isOffScreen = false;
  Offset targetLocation;

  double get speed => game.tileSize * 3;

  Computers(this.game) {
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = game.rnd.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, computersRect.inflate(2));
    } else {
      computerSprite[computerSpriteIndex.toInt()]
          .renderRect(c, computersRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      computersRect = computersRect.translate(0, game.tileSize * 12 * t);
      if (computersRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    }
    double stepDistance = speed * t;
    Offset toTarget =
        targetLocation - Offset(computersRect.left, computersRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget =
          Offset.fromDirection(toTarget.direction, stepDistance);
      computersRect = computersRect.shift(stepToTarget);
    } else {
      computersRect = computersRect.shift(toTarget);
      setTargetLocation();
    }
  }

  void onTapDown() {
    isDead = true;
    game.spawnFly();
  }
}
