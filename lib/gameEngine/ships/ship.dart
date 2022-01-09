import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/gameEngine/ships/ship_cell.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

class Ship extends StatefulWidget {
  final ShipType shipType;
  final int decks;
  const Ship({Key key, @required this.shipType, @required this.decks})
      : super(key: key);

  @override
  State<Ship> createState() => _ShipState();
}

class _ShipState extends State<Ship> {
  ShipType curShipType;

  @override
  void initState() {
    curShipType = widget.shipType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GamePageController gamePageController = Get.find<GamePageController>();
    return GetBuilder<GamePageController>(builder: (_) {
      return GestureDetector(
        onDoubleTap: () {
          if (curShipType == ShipType.Vertical) {
            setState(() {
              curShipType = ShipType.Horizontal;
            });
          } else {
            setState(() {
              curShipType = ShipType.Vertical;
            });
          }
        },
        child: Draggable(
          onDraggableCanceled: (velocity, offset) {
            gamePageController.move(false);
          },
          onDragStarted: () {
            gamePageController.move(true);
          },
          data: [],
          child: curShipType == ShipType.Vertical
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _shipDecksCreater(
                      decks: widget.decks,
                      shipType: curShipType,
                      placeHolded: false),
                )
              : Row(
                  children: _shipDecksCreater(
                      decks: widget.decks,
                      shipType: curShipType,
                      placeHolded: false),
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                ),
          feedback: curShipType == ShipType.Vertical
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _shipDecksCreater(
                      decks: widget.decks,
                      shipType: curShipType,
                      placeHolded: false),
                )
              : Row(
                  children: _shipDecksCreater(
                      decks: widget.decks,
                      shipType: curShipType,
                      placeHolded: false),
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                ),
          childWhenDragging: curShipType == ShipType.Vertical
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _shipDecksCreater(
                      decks: widget.decks,
                      shipType: curShipType,
                      placeHolded: true),
                )
              : Row(
                  children: _shipDecksCreater(
                      decks: widget.decks,
                      shipType: curShipType,
                      placeHolded: true),
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                ),
        ),
      );
    });
  }
}

enum ShipType { Horizontal, Vertical }

List<Widget> _shipDecksCreater(
    {int decks, ShipType shipType, bool placeHolded}) {
  List<Widget> shipParts = [];
  for (var x = 0; x <= decks; x++) {
    shipParts.add(ShipCell(
      index: x,
      shipLength: decks,
      shipType: shipType,
      placeHolded: placeHolded,
    ));
  }
  return shipParts;
}
