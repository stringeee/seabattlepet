import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/gameEngine/ships/ship.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

class GameShipsZone extends StatelessWidget {
  const GameShipsZone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamePageController gamePageController = Get.find<GamePageController>();
    return GetBuilder<GamePageController>(builder: (_) {
      RxList<Ship> fourDeckShips = RxList.filled(
          gamePageController.ships["4"],
          Ship(
            shipType: ShipType.Vertical,
            decks: 3,
          ));
      RxList<Ship> threeDeckShips = RxList.filled(
          gamePageController.ships["3"],
          Ship(
            shipType: ShipType.Vertical,
            decks: 2,
          ));
      RxList<Ship> twoDeckShips = RxList.filled(
          gamePageController.ships["2"],
          Ship(
            shipType: ShipType.Vertical,
            decks: 1,
          ));
      RxList<Ship> oneDeckShips = RxList.filled(
          gamePageController.ships["1"],
          Ship(
            shipType: ShipType.Vertical,
            decks: 0,
          ));
      return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(9),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xffff5858).withOpacity(0.8),
                    Color(0xfff09819)
                  ])),
          child: Container(
              width: 380,
              height: 480,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    ...fourDeckShips,
                    ...threeDeckShips,
                    ...twoDeckShips,
                    ...oneDeckShips
                  ])));
    });
  }
}
