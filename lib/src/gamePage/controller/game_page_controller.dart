import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webpetgame/gameEngine/gameEngine.dart';
import 'package:webpetgame/gameEngine/game_field_cell.dart';
import 'package:webpetgame/gameEngine/ships/ship.dart';

class GamePageController extends GetxController {
  var gameCells = FieldGenerator().generateField();

  RxList<RxList<Map<String, int>>> placedShips = RxList.empty();

  RxInt currentDeckIndex = (-1).obs;
  RxInt currentShipLength = (-1).obs;
  ShipType currentShipType = ShipType.Vertical;

  RxBool moving = false.obs;

  RxMap<String, int> ships = {"4": 1, "3": 2, "2": 3, "1": 4}.obs;

  Widget dragTargetBuild(BuildContext c, dynamic candidateData,
      List<dynamic> rejectedData, TargetClass targetClass) {
    return FieldCellWidget(
      targetWidgetClass: targetClass,
    );
  }

  void onAccept(TargetClass targetClass) {
    bool isVertical = currentShipType == ShipType.Vertical;

    var start = isVertical
        ? (targetClass.y - currentDeckIndex.value)
        : (targetClass.x - currentDeckIndex.value);
    var end = isVertical
        ? (targetClass.y - currentDeckIndex.value) + currentShipLength.value
        : (targetClass.x - currentDeckIndex.value) + currentShipLength.value;

    if (checkCellAvailability(targetClass)) {
      RxList<Map<String, int>> currentShipPlace = RxList.empty();
      if (isVertical) {
        for (var y = start; y <= end; y++) {
          gameCells[y][targetClass.x].accepted = true;
          currentShipPlace.add({"x": targetClass.x, "y": y}.obs);
          update();
        }
      } else {
        for (var x = start; x <= end; x++) {
          gameCells[targetClass.y][x].accepted = true;
          currentShipPlace.add({"x": x, "y": targetClass.y}.obs);
          update();
        }
      }

      placedShips.add(currentShipPlace);
      ships["${placedShips[getShipIndex(targetClass.x, targetClass.y)].length}"] =
          ships["${placedShips[getShipIndex(targetClass.x, targetClass.y)].length}"] -
              1;
      update();
    }
  }

  void deleteShip(int x, int y) {
    int foundedIndex = getShipIndex(x, y);
    placedShips[foundedIndex].forEach((element) {
      gameCells[element["y"]][element["x"]].accepted = false;
    });
    ships["${placedShips[getShipIndex(x, y)].length}"] =
        ships["${placedShips[getShipIndex(x, y)].length}"] + 1;
    placedShips.removeAt(foundedIndex);
  }

  int getShipIndex(int x, int y) {
    int foundedIndex = 0;
    for (var shipIndex = 0; shipIndex <= placedShips.length - 1; shipIndex++) {
      placedShips[shipIndex].forEach((element) {
        if (element.toString() == {"x": x, "y": y}.obs.toString()) {
          foundedIndex = shipIndex;
        } else {}
      });
      update();
    }
    return foundedIndex;
  }

  bool checkCellAvailability(TargetClass targetClass) {
    bool available = false;
    bool isVertical = currentShipType == ShipType.Vertical;

    var start = isVertical
        ? (targetClass.y - currentDeckIndex.value)
        : (targetClass.x - currentDeckIndex.value);
    var end = isVertical
        ? (targetClass.y - currentDeckIndex.value) + currentShipLength.value
        : (targetClass.x - currentDeckIndex.value) + currentShipLength.value;

    if (isVertical) {
      for (var y = start; y <= end; y++) {
        try {
          if (gameCells[y][targetClass.x].accepted) {
            available = false;
          } else {
            available = true;
          }
        } catch (e) {
          available = false;
          break;
        }
      }
    } else {
      for (var x = start; x <= end; x++) {
        try {
          if (gameCells[targetClass.y][x].accepted) {
            available = false;
          } else {
            available = true;
          }
        } catch (e) {
          available = false;
          break;
        }
      }
    }

    if (available) {
      if (isVertical) {
        for (var curY = start - 1; curY <= end + 1; curY++) {
          for (var curX = targetClass.x - 1;
              curX <= targetClass.x + 1;
              curX++) {
            try {
              if (gameCells[curY][curX].accepted) {
                available = false;
              }
            } catch (e) {}
          }
        }
      } else {
        for (var curY = targetClass.y - 1; curY <= targetClass.y + 1; curY++) {
          for (var curX = start - 1; curX <= end + 1; curX++) {
            try {
              if (gameCells[curY][curX].accepted) {
                available = false;
              }
            } catch (e) {}
          }
        }
      }
    }

    return available;
  }

  void changeCurrentDeckIndex({int index, int length, ShipType shipType}) {
    currentDeckIndex = index.obs;
    currentShipLength = length.obs;
    currentShipType = shipType;
  }

  void move(bool move) {
    moving.value = move;
  }

  RxBool shipsPlaced() {
    int shipsCount = 0;
    ships.forEach((key, value) {
      shipsCount += value;
    });
    if (shipsCount == 0) {
      return true.obs;
    } else {
      return false.obs;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
