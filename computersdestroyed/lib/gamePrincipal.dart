import 'dart:ui';
import 'package:computerdestroyed/view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:computerdestroyed/components/computers.dart';
import 'package:computerdestroyed/components/computerBlack.dart';
import 'package:computerdestroyed/components/fundo.dart';

/* arquivo principal para rodar todo o game e que pega todos os outros */
/* arquivo que pegaas imagens para o jogo */

class GamePrincipal extends Game {
  Size screenSize;
  double tileSize;
  List<Computers> flies;
  Random rnd;
  double x, y;

  int score;

  Fundo fundo;

  View activeView = View.home;

  GamePrincipal() {
    initialize();
  }

  void initialize() async {
    flies = List<Computers>();
    rnd = Random();
    score = 0;
    resize(await Flame.util.initialDimensions());

    fundo = Fundo(this);
    spawnFly();
  }

  void spawnFly() {
    x = rnd.nextDouble() * (screenSize.width - tileSize);
    y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(ComputerBlack(this, x, y));
  }

  void render(Canvas canvas) {
    fundo.render(canvas);

    flies.forEach((Computers computers) => computers.render(canvas));
  }

  void update(double t) {
    flies.forEach((Computers computers) => computers.update(t));
    flies.removeWhere((Computers computers) => computers.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Computers planets) {
      if (planets.computersRect.contains(d.globalPosition)) {
        score++;
        print("Points: " + score.toString());
        planets.onTapDown();
      }
    });
  }
}
