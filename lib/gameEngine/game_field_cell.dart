import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/gameEngine/ships/ship_cell.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

import 'gameEngine.dart';

class FieldCellWidget extends StatelessWidget {
  final TargetClass targetWidgetClass;
  const FieldCellWidget({
    Key key,
    @required this.targetWidgetClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamePageController gamePageController = Get.find();

    return Obx(() {
      return GestureDetector(
        onDoubleTap: () => gamePageController.deleteShip(
            targetWidgetClass.x, targetWidgetClass.y),
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 500),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
            gradient: gamePageController
                    .gameCells[targetWidgetClass.y][targetWidgetClass.x]
                    .accepted
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff874da2), Color(0xffc43a30)])
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const [Colors.white, Color(0xffe2ebf0)]),
          ),
        ),
      );
    });
  }
}
