import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:webpetgame/src/gamePage/bin/game_page_binding.dart';
import 'package:webpetgame/src/gamePage/view/game_page.dart';
import 'package:webpetgame/src/startPage/view/start_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SeaBattle",
      defaultTransition: Transition.noTransition,
      initialRoute: StartPage.endpoint,
      getPages: [
        GetPage(name: StartPage.endpoint, page: () => StartPage()),
        GetPage(
            name: GamePage.endpoint,
            page: () => GamePage(),
            binding: GamePageBinding())
      ],
    );
  }
}
