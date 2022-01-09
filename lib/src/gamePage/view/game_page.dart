import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:webpetgame/gameEngine/game_field.dart';
import 'package:webpetgame/gameEngine/ships/ship.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';
import 'package:webpetgame/src/gamePage/view/game_ships_zone.dart';
import 'package:webpetgame/src/startPage/view/start_page.dart';
import 'package:webpetgame/src/utils/background_widget.dart';

class GamePage extends GetWidget<GamePageController> {
  static const endpoint = "/gamePage";
  const GamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Stack(
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeInLeft(
                  child: GameShipsZone(),
                  duration: Duration(milliseconds: 400)),
              SizedBox(
                width: 100,
              ),
              FadeInRight(
                  child: GameField(), duration: Duration(milliseconds: 400)),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Obx(() => controller.shipsPlaced().value
                ? FadeInDown(
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(240, 60),
                        primary: Colors.orange,
                        textStyle: const TextStyle(fontSize: 30)),
                    onPressed: () {
                      Get.toNamed(StartPage.endpoint);
                    },
                    child: const Text('Start'),
                  ))
                : Container()),
            SizedBox(height: 30)
          ]),
        )
      ],
    ));
  }
}
