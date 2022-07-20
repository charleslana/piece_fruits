import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/splashscreen_controller.dart';

class SplashscreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(SplashscreenController.new);
  }
}
