import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

import 'gameEngine.dart';

class GameField extends StatelessWidget {
  const GameField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamePageController gamePageController = Get.find<GamePageController>();
    return GetBuilder<GamePageController>(
        builder: (_) => Container(
              decoration: BoxDecoration(
                color: Color(0xff706EB9).withOpacity(0.4),
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children:
                    FieldGenerator().generateWidgetField(gamePageController),
                mainAxisSize: MainAxisSize.min,
              ),
            ));
  }
}
