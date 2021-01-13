import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:computerdestroyed/gamePrincipal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

void main() async {
  Util flameUtil = Util();
  WidgetsFlutterBinding.ensureInitialized();

  Flame.images.loadAll(<String>[
    'fundo/fundoTec.jpg',
    'files/pc.png',
    'files/dead.png',
  ]);

  GamePrincipal game = GamePrincipal();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);
}
