import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

import 'game_field_cell.dart';

class FieldGenerator {
  RxList<RxList<TargetClass>> generateField() {
    RxList<RxList<TargetClass>> finalMap = RxList.empty();
    for (var y = 0; y <= 9; y++) {
      RxList<TargetClass> currField = RxList.empty();
      for (var x = 0; x <= 9; x++) {
        TargetClass dragTarget = TargetClass(x: x, y: y);
        currField.add(dragTarget);
      }
      finalMap.add(currField);
    }
    return finalMap;
  }

  List<Widget> generateWidgetField(GamePageController gamePageController) {
    RxList<Widget> children = RxList.empty();
    gamePageController.gameCells.forEach((element) {
      List<Widget> rowChildren = element
          .map((targetClass) => DragTarget(
                builder: (context, candidateData, rejectedData) =>
                    FieldCellWidget(
                  targetWidgetClass: targetClass,
                ),
                onAccept: (data) {
                  gamePageController.onAccept(targetClass);
                  gamePageController.move(false);
                },
              ))
          .toList();
      Row finalRow = Row(
        children: rowChildren,
        mainAxisSize: MainAxisSize.min,
      );
      children.add(finalRow);
    });

    return children.value;
  }
}

class TargetClass {
  int x;
  int y;
  bool accepted = false;
  TargetClass({@required this.x, @required this.y});

  @override
  String toString() {
    return "x: $x, y: $y";
  }
}
