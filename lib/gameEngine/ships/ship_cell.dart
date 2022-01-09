import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/gameEngine/ships/ship.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

class ShipCell extends StatelessWidget {
  final int shipLength;
  final int index;
  final ShipType shipType;
  final bool placeHolded;
  const ShipCell(
      {Key key,
      @required this.index,
      @required this.shipLength,
      @required this.shipType,
      @required this.placeHolded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamePageController gamePageController = Get.find<GamePageController>();
    return GetBuilder<GamePageController>(builder: (_) {
      return placeHolded
          ? Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
                color: Colors.grey,
              ),
            )
          : MouseRegion(
              onEnter: (e) {
                if (gamePageController.moving.isFalse) {
                  gamePageController.changeCurrentDeckIndex(
                      index: index, length: shipLength, shipType: shipType);
                }
              },
              onExit: (e) {
                if (gamePageController.moving.isFalse) {
                  gamePageController.changeCurrentDeckIndex(
                      index: -1, length: shipLength, shipType: shipType);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    gradient: LinearGradient(colors: shipColor(shipLength))),
              ),
            );
    });
  }
}

List<Color> shipColor(int shipLength) {
  List<Color> res = [];
  if (shipLength == 0) {
    res = [Color(0xff6a85b6), Color(0xffbac8e0)];
  } else if (shipLength == 1) {
    res = [Color(0xfff83600), Color(0xfff9d423)];
  } else if (shipLength == 2) {
    res = [Color(0xffb721ff), Color(0xff21d4fd)];
  } else if (shipLength == 3) {
    res = [Color(0xff16a085), Color(0xfff4d03f)];
  }
  return res;
}
