import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webpetgame/src/gamePage/view/game_page.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(GamePage.endpoint),
      child: Container(
        width: 340,
        height: 70,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffff5858), Color(0xfff09819)]),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
            child: Text(
          "Create Your Own Field",
          style: TextStyle(color: Colors.white, fontSize: 25),
        )),
      ),
    );
  }
}
