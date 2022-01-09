import 'package:get/get.dart';
import 'package:webpetgame/src/gamePage/controller/game_page_controller.dart';

class GamePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GamePageController());
  }
}
