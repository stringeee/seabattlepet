import 'package:flutter/material.dart';
import 'package:webpetgame/gameEngine/ships/ship.dart';
import 'package:get/get.dart';

class ShipClass {
  final ShipType shipType;
  final RxInt lastTapIndex;
  final RxInt cellAxisX;
  final RxInt cellAxisY;

  ShipClass(
      {@required this.shipType,
      @required this.lastTapIndex,
      @required this.cellAxisX,
      @required this.cellAxisY});
}
